#!/usr/bin/make

all: 	install
.PHONY: all build install clean

build:
	gcc `pkg-config --cflags --libs gnome-keyring-1 glib-2.0` -o gnome-keyring-query gnome-keyring-query.c

install: build
	install -d --owner=${USER} --group=${USER} ${HOME}/.local/share/man/man1
	install --owner=${USER} --group=${USER} --mode=755 gnome-keyring-query ${HOME}/.local/bin/gnome-keyring-query
	install --owner=${USER} --group=${USER} --mode=644 gnome-keyring-query.1 ${HOME}/.local/share/man/man1/gnome-keyring-query.1

clean:
	rm ${HOME}/.local/bin/gnome-keyring-query
	rm ${HOME}/.local/share/man/man1/gnome-keyring-query.1
