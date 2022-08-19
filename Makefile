.PHONY: dir-config
.PHONY: dir-opt
.PHONY: dir-vim
.PHONY: install-all
.PHONY: install-bash
.PHONY: install-bash-scripts
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
	stow -t ~/opt --no --verbose bash-scripts-git || true
	stow -t ~/opt --no --verbose bash-scripts-k8s || true
	stow -t ~/opt --no --verbose bash-scripts-thirdparty || true
	stow -t ~/opt --no --verbose bash-scripts-various || true

dir-config:
	mkdir -p ~/.config/jrnl
	mkdir -p ~/.config/nvim

dir-opt:
	mkdir -p ~/opt

dir-vim:
	mkdir -p ~/.vim

install-all: install-bash install-bash-scripts install-config install-git install-tmux install-vim

install-bash:
	stow -t ~ --verbose bash

install-bash-scripts: dir-opt
	stow -t ~/opt --verbose bash-scripts-git
	stow -t ~/opt --verbose bash-scripts-k8s
	stow -t ~/opt --verbose bash-scripts-thirdparty
	stow -t ~/opt --verbose bash-scripts-various

install-config: dir-config
	stow -t ~ --verbose config

install-git:
	stow -t ~ --verbose git

install-tmux:
	stow -t ~ --verbose tmux

install-vim: dir-vim
	stow -t ~ --verbose vim
