# VARIABLES
SHELL = /bin/sh
NAME = dmscripts

prefix = /usr
datarootdir = $(prefix)/share
datadir = $(datarootdir)
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
infodir = $(datarootdir)/info
mandir = $(datarootdir)/man

SCRIPTS := $(wildcard ./scripts/*)

clean:
	@rm man/dmscripts.1.gz

build: 
	@pandoc -s -t man man/man.org -o man/dmscripts.1
	gzip man/dmscripts.1


install:
	@echo $(prefix)
	@echo $(infodir)
	@echo $(mandir)
	@echo $(bindir)
	
	install -Dm 775 $(SCRIPTS) -t $(bindir)

	install -Dm 664 man/dmscripts.1.gz $(mandir)/man1
	mandb

	install -Dm644 LICENSE "$(datarootdir)/licenses/$(NAME)/LICENSE"
	install -Dm644 README.md "$(datarootdir)/doc/$(NAME)/README.md"



