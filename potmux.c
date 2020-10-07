#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <getopt.h>
#include <errno.h>
#include <sys/stat.h>

#include "symbols.h"
#include "potmux.h"

Button buttons[4] = {
  {  .bit = 0, .key = 0, .offset = 0x13, .parsed = false },
  {  .bit = 0, .key = 0, .offset = 0x1a, .parsed = false },
  {  .bit = 0, .key = 0, .offset = 0x21, .parsed = false },
  {  .bit = 0, .key = 0, .offset = 0x28, .parsed = false },
};
uint8_t current = 0;

Line _line = { .port = 0, .value = 0, .offset = 0x2f, .parsed = false };
Line *line = &_line;

//-----------------------------------------------------------------------------

uint8_t getKey(char *str) {
  for(int i=0; i<sizeof(symbols)/sizeof(Symbol); i++) {
    if(strcasecmp(symbols[i].name, str) == 0) {
      return (uint8_t) i;
    }
  }
  return 0xff;
}

//-----------------------------------------------------------------------------

bool isKey(char *str) {
  return getKey(str) != 0xff;
}

//-----------------------------------------------------------------------------

bool isSwitch(char *str) {
  return (strcasecmp(str, "on") == 0) || (strcasecmp(str, "off") == 0);
}

//-----------------------------------------------------------------------------

uint8_t getSwitchValue(char *str) {
  return (strcasecmp(str, "on") == 0) ? 0 : 1;
}

//-----------------------------------------------------------------------------

bool parse(char* spec) {
  Button *button;
  uint8_t bit;
  char *arg;

  if((strlen(spec) >= 4) &&
     (spec[0] >= 'a' && spec[0] <= 'z') &&
     (spec[1] >= '0' && spec[1] <= '7') &&
     (spec[2] == ':')) {

    bit = spec[1] - '0';
    bit |= (spec[0] - 'a')<<3;
    arg = spec+3;

    if(isKey(arg)) {
      button = &(buttons[current++]);

      if(current > 4) {
        fprintf(stderr, "error: \"%s\": all four buttons already defined\n", spec);
        return false;
      }
      if((bit>>3) > 1) {
        fprintf(stderr, "error: \"%s\": buttons can only be mapped to native ports (a or b)\n", spec);
        return false;
      }

      button->bit = bit;
      button->key = getKey(arg);
      return button->parsed = true;
    }
    else if(isSwitch(arg)) {

      if(line->parsed) {
        fprintf(stderr, "error: \"%s\": on/off line already specified\n", spec);
        return false;
      }
      line->port = bit;
      line->value = getSwitchValue(arg);

      return line->parsed = true;
    }
    fprintf(stderr, "error: \"%s\": unknown key name: \"%s\"\n", spec, arg);
  }
  return false;
}

//-----------------------------------------------------------------------------

int main(int argc, char **argv) {

  int result = EXIT_SUCCESS;

  FILE* in;

  FILE* out = stdout;
  char* outfile = NULL;

  uint8_t *data = calloc(1, sizeof(uint8_t));
  uint16_t load_address;

  struct option options[] = {
    { "help",     no_argument,       0, 'h' },
    { "version",  no_argument,       0, 'v' },
    { "outfile",  required_argument, 0, 'o' },
    { 0, 0, 0, 0 },
  };
  int option, option_index;

  while(1) {
    option = getopt_long(argc, argv, "hvo:", options, &option_index);

    if(option == -1)
      break;

    switch (option) {

    case 'h':
      help();
      goto done;
      break;

    case 'v':
      version();
      goto done;
      break;

    case 'o':
      outfile = strdup(optarg);
      break;

    case '?':
    case ':':
      result = EXIT_FAILURE;
      goto done;
    }
  }

  argc -= optind;
  argv += optind;

  if(argc < 2) {
    help();
    return EXIT_FAILURE;
  }

  // first arg is filename...
  char *filename = argv[0];
  argc--; argv++;

  // check if it is readable and has data...
  struct stat st;

  if((in = fopen(filename, "rb")) == NULL) {
    goto error;
  }

  if(fstat(fileno(in), &st) == -1) {
    goto error;
  }
  int size = st.st_size;

  // get load address...
  fread(&load_address, sizeof(uint8_t), 2, in);
  size -= 2;

  // check for $0801
  if(load_address != 0x0801) {
    printf("error: %s: load address $%04X not supported\n", filename, load_address);
    goto fail;
  }

  // check size < 202 blocks
  if(size >= 0xc800-code_size-2) {
    printf("error: %s: too big to be patched (%d blocks)\n", filename, size/256);
    goto fail;
  }

  // read program
  data = (uint8_t*) realloc(data, size * sizeof(uint8_t));

  fread(data, sizeof(uint8_t), size, in);
  fclose(in);

  // parse buttons and switch...
  for(int i=0; i<argc; i++) {
    if(!parse(argv[i])) {
      result = EXIT_FAILURE;
      goto done;
    }
  }

  // install buttons...
  Button *button;
  for(int i=0; i<4; i++) {
    button = &buttons[i];

    if(button->parsed) {
      code[button->offset+1] = button->bit;
      code[button->offset+3] = button->key;
    }
    else { // nop...
      for(int k=0; k<7; k++) {
        code[button->offset+k] = 0xea;
      }
    }
  }

  // install switch...
  if(line->parsed) {
    code[line->offset+6] = line->port;
    code[line->offset+11] = line->value;
  }
  else { // nop...
    for(int i=0; i<15; i++) {
      code[line->offset+i] = 0xea;
    }
  }

  // determine start of payload
  uint16_t start = 0x0801+size;

  code[0xa5] = (uint8_t) (start & 0xff);
  code[0xa6] = (uint8_t) (start >> 8);

  if(outfile) {
    if((out = fopen(outfile, "wb")) == NULL) {
      fprintf(stderr, "%s: %s\n", outfile, strerror(errno));
      goto fail;
    }
  }

  // write out payload
  for(int i=0; i<code_size; i++) {
    putc(code[i], out);
  }

  for(int i=code_size-2; i<size; i++) {
    putc(data[i], out);
  }

  for(int i=0; i<code_size; i++) {
    putc(data[i], out);
  }
  fclose(out);

 done:
  free(data);
  return result;

 error:
  fprintf(stderr, "%s: %s\n", filename, strerror(errno));
  if(in) fclose(in);
  result = EXIT_FAILURE;
  goto done;

 fail:
  result = EXIT_FAILURE;
  goto done;
}

void version() {
  printf("Potmux v%.1f\n"
         "Patches C64 programs with potmux configuration\n"
         "Copyright (C) 2020 Henning Liebenau.\n"
         "License GPLv3: GNU GPL version 3 <http://gnu.org/licenses/gpl.html>.\n"
         "This is free software: you are free to change and redistribute it.\n"
         "There is NO WARRANTY, to the extent permitted by law.\n", VERSION);
}

void help() {
  version();

  printf("\n"
         "Usage: potmux [<option>...] <program> [<button|switch>...]\n"
         "\n"
         "Options:\n"
         "         -h, --help           : print this help text\n"
         "         -v, --version        : print version information\n"
         "         -o, --outfile <file> : output file (default: stdout)\n"
         "\n"
         "Arguments:\n"
         "         <program> : C64 program file to patch\n"
         "         <button>  : route a joystick button to a key\n"
         "         <switch>  : specify enable line and state\n"
         "\n"
         "Example:\n"
         "         potmux -o patched.prg game.prg a0:on b1:space\n"
         "\n"
         "Assuming that the PotMux EN line is connected to the keyman line on\n"
         "port a bit 0, the \"a0:on\" switch specification assures that the potmux\n"
         "will be enabled by pulling that line low. And assuming that one of the\n"
         "PotMux button output lines is connected to the keyman control line on\n"
         "port b bit 1, the \"b1:space\" will send a space key press when the\n"
         "corresponding button is pressed.\n\n"
         );
}
