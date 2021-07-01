#!/usr/bin/make

PREFIX ?= /usr/local

all: 	install
.PHONY: all build install clean

build: 
	gcc `pkg-config --cflags --libs gnome-keyring-1 glib-2.0` -o gnome-keyring-query gnome-keyring-query.c

install: build
	install -d -g users ${PREFIX}/share/man/man1
	install -g users -m 755 gnome-keyring-query ${PREFIX}/bin/gnome-keyring-query
	install -g users -m 644 gnome-keyring-query.1 ${PREFIX}/share/man/man1/gnome-keyring-query.1

clean:
	rm ${PREFIX}/bin/gnome-keyring-query
	rm ${PREFIX}/share/man/man1/gnome-keyring-query.1
