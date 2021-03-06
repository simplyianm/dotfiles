#!/usr/bin/env bash

DOTFILES=$(pwd)/$(dirname $0)
cd $DOTFILES
zsh -c 'nixfmt **/*.nix'

cd $DOTFILES/nix
nix flake update

cd $DOTFILES
nix flake update

cd $DOTFILES/private/flakes/darwin
nix flake update

cd $DOTFILES/private/flakes/nixos
nix flake update

cd $DOTFILES
git add .
