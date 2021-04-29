# VARIABLES
SHELL = /bin/sh

prefix = /usr/local
datarootdir = $(prefix)/share
datadir = $(datarootdir)
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
infodir = $(datarootdir)/info
mandir = $(datarootdir)/man

SCRIPTS := $(wildcard ./scripts/*)

build:
	@pandoc -s -t man man/man.org -o man/dmscripts.1
	gzip man/dmscripts.1


install:
	@echo $(prefix)
	@echo $(infodir)
	@echo $(mandir)
	@echo $(bindir)
	# install -Dm755 ${script} -t "$DESTDIR"
	# install -Dm 775 $(SCRIPTS) -t $(bindir)

	install -Dm 664 man/dmscripts.1.gz $(mandir)/man1



