.PHONY: dir-config
.PHONY: dir-vim
.PHONY: install-all
.PHONY: install-bash
.PHONY: install-config
.PHONY: install-git
.PHONY: install-tmux
.PHONY: install-vim
.PHONY: simulate-all

simulate-all:
	stow -t ~ --no --verbose bash || true
	stow -t ~ --no --verbose config || true
	stow -t ~ --no --verbose git || true
	stow -t ~ --no --verbose tmux || true
	stow -t ~ --no --verbose vim || true

dir-config:
	mkdir -p ~/.config/jrnl

dir-vim:
	mkdir -p ~/.vim

install-all: install-bash install-config install-git install-tmux install-vim

install-bash:
	stow -t ~ --verbose bash

install-config: dir-config
	stow -t ~ --verbose config

install-git:
	stow -t ~ --verbose git

install-tmux:
	stow -t ~ --verbose tmux

install-vim: dir-vim
	stow -t ~ --verbose vim
