#!/usr/bin/make

all: 	install
.PHONY: all build install clean

build: 
	gcc `pkg-config --cflags --libs gnome-keyring-1 glib-2.0` -o gnome-keyring-query gnome-keyring-query.c

install: build
	install -d -g users ~/.local/share/man/man1
	install -g users -m 755 gnome-keyring-query ~/.local/bin/gnome-keyring-query
	install -g users -m 644 gnome-keyring-query.1 ~/.local/share/man/man1/gnome-keyring-query.1

clean:
	rm ~/.local/bin/gnome-keyring-query
	rm ~/.local/share/man/man1/gnome-keyring-query.1
