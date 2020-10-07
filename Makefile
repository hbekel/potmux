VERSION=1.0
REVISION=2

CC?=gcc
CFLAGS=-std=gnu99 -Wall -O2 -DVERSION=$(VERSION)
MINGW=i686-w64-mingw32
KASM?=kasm4

PREFIX?=/usr/local
DESTDIR=

MD5SUM=md5sum
ifeq ($(UNAME), Darwin)
  MD5SUM=md5 -r
endif

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

install: potmux
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m755 potmux $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/potmux

gerber:
	make -C hardware/gerber/

release: gerber zip
	git archive --prefix=potmux-$(VERSION)/ -o ../potmux-$(VERSION).tar.gz HEAD && \
	$(MD5SUM) ../potmux-$(VERSION).tar.gz > ../potmux-$(VERSION).tar.gz.md5

	mv hardware/gerber/potmux-r$(REVISION)-gerber.zip ..
	$(MD5SUM) ../potmux-r$(REVISION)-gerber.zip > ../potmux-r$(REVISION)-gerber.zip.md5

	mv potmux-$(VERSION).zip ..
	$(MD5SUM) ../potmux-$(VERSION).zip > ../potmux-$(VERSION).zip.md5

zip: win32
	zip potmux-$(VERSION).zip potmux.exe

clean:
	rm -f potmux
	rm -f code
	rm -f *.inc
	rm -f *.d64
	rm -f *.prg
	rm -f *.exe
	rm -f *.exe.stackdump
