VERSION=1.0

CC?=gcc
CFLAGS=-std=gnu99 -Wall -O2 -DVERSION=$(VERSION)
KASM=kasm4

.PHONY: all clean

all: potmux

code: potmux.asm
	$(KASM) -o code $<

potmux.inc: code
	xxd -i code | \
		sed 's/unsigned char/uint8_t/g' | \
		sed 's/unsigned int/uint16_t/g' | \
		sed 's/_len/_size/g' > $@

potmux: potmux.c potmux.h potmux.inc symbols.h
	$(CC) $(CFLAGS) -o $@ potmux.c

clean:
	rm -f potmux
	rm -f code
	rm -f *.inc
	rm -f *.d64
	rm -f *.prg
	rm -f *.exe.stackdump
