VERSION=1.0

CC?=gcc
CFLAGS=-std=gnu99 -Wall -O2 -DVERSION=$(VERSION)
MINGW=i686-w64-mingw32
KASM=kasm4

.PHONY: all clean

all: linux

linux: potmux
win32: potmux.exe

code: potmux.asm
	$(KASM) -o code $<

potmux.inc: code
	xxd -i code | \
		sed 's/unsigned char/uint8_t/g' | \
		sed 's/unsigned int/uint16_t/g' | \
		sed 's/_len/_size/g' > $@

potmux: potmux.c potmux.h potmux.inc symbols.h
	$(CC) $(CFLAGS) -o $@ potmux.c

potmux.exe: potmux.c potmux.h potmux.inc symbols.h
	$(MINGW)-gcc $(CFLAGS) -o $@ potmux.c

clean:
	rm -f potmux
	rm -f code
	rm -f *.inc
	rm -f *.d64
	rm -f *.prg
	rm -f *.exe
	rm -f *.exe.stackdump
