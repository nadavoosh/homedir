#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

# Update dotfiles itself first
if [ ! -e $dotfiles/.git ]; then
  echo "Cloning dotfiles"
  git clone https://github.com/nadavoosh/dotfiles.git $dotfiles
else
  echo "Updating dotfiles"
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
fi

# install git bash support
curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git

# bash
echo "Setting up bash..."
ln -sfv "$DOTFILES_DIR/runcom/bash_profile" ~/.bash_profile
ln -sfv "$DOTFILES_DIR/runcom/bashrc" ~/.bashrc
ln -sfv "$DOTFILES_DIR/runcom/bash_alias" ~/.bash_alias
ln -sfv "$DOTFILES_DIR/runcom/bashrc.virtualenvwrapper" ~/.bashrc.virtualenvwrapper
ln -sfv "$DOTFILES_DIR/runcom/prompt" ~/.prompt

# vim
echo "Setting up vim..."
ln -sfv "$DOTFILES_DIR/vimrc" ~/.vimrc
