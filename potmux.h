#ifndef POTMUX_H
#define POTMUX_H

#include <stdint.h>

typedef struct {
  uint8_t bit;
  uint8_t key;
  uint8_t offset;
  bool parsed;
} Button;

typedef struct {
  uint8_t port;
  uint8_t value;
  uint8_t offset;
  bool parsed;
} Line;

void help(void);
void version(void);

#include "potmux.inc"

#endif // POTMUX_H
