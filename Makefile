# VARIABLES
SHELL = /bin/sh
NAME = dmscripts

PREFIX=/usr
SCRIPTS := $(wildcard ./scripts/*)


build: 
	@pandoc -s -t man man/man.org -o man/dmscripts.1
	gzip man/dmscripts.1

install:
	echo $(DESTDIR)$(PREFIX)
	install -Dm 775 $(SCRIPTS) -t $(DESTDIR)$(PREFIX)/bin/
	install -Dm 644 man/dmscripts.1.gz $(DESTDIR)$(MANPREFIX)/man1/dmscripts.1.gz
	install -Dm644 LICENSE "$(DESTDIR)$(PREFIX)/share/licenses/$(NAME)/LICENSE"
	install -Dm644 README.md "$(DESTDIR)$(PREFIX)/share/doc/$(NAME)/README.md"
	mandb



clean:
	@rm man/dmscripts.1.gz

.PHONY: clean build install


