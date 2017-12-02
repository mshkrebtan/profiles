#!/bin/bash

# Get the installation script directory path
DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

install_vim() {
  vundle_path="$HOME/.vim/bundle/Vundle.vim"

  if [ ! -d "$vundle_path" ]; then
    # Clone Vundle first
    git clone https://github.com/VundleVim/Vundle.vim.git $vundle_path
  else
    cd $vundle_path
    git fetch origin && git pull
  fi

  # Link .vimrc
  ln -sf $DIR/vim/vimrc ~/.vimrc

  # Install/Update all plugins
  vim +PluginUpdate +qall

  # Link Russian-jcukenmac keyma
  mkdir -p ~/.vim/keymap
  ln -sf $DIR/vim/vim/keymap/russian-jcukenmac.vim \
    ~/.vim/keymap/

  # Link additional tabular commands
  mkdir -p ~/.vim/bundle/tabular/after/plugin/
  ln -sf $DIR/vim/vim/bundle/tabular/after/plugin/my_tabular_commands.vim \
    ~/.vim/bundle/tabular/after/plugin/

  # Link filetype definitions
  ln -sf $DIR/vim/vim/ftdetect ~/.vim/
}

install_tmux() {
  tmux_plugin_path="$HOME/.tmux/plugins/tpm"

  if [ ! -d "$tmux_plugin_path" ]; then
    # Clone Tmux Plugin Manager
    git clone https://github.com/tmux-plugins/tpm $tmux_plugin_path
  else
    cd $tmux_plugin_path
    git fetch origin && git pull
  fi

  # Link .tmux.conf
  ln -sf $DIR/tmux/tmux.conf ~/.tmux.conf
}

# Git in Bash
curl https://raw.githubusercontent.com\
/git/git/master/contrib/completion/git-prompt.sh \
  -o ~/.git-prompt.sh

# Python
ln -sf $DIR/python/pythonrc ~/.pythonrc

# Base16 Shell
base16_shell_path="$HOME/.config/base16-shell"
if [ ! -d "$base16_shell_path" ]; then
  git clone https://github.com/chriskempson/base16-shell.git \
    $base16_shell_path
else
  cd $base16_shell_path
  git fetch origin && git pull
fi

# Bash
ln -sf $DIR/bash/bash_profile ~/.bash_profile
ln -sf $DIR/bash/bash_aliases ~/.bash_aliases
ln -sf $DIR/bash/bash_tweaks ~/.bash_tweaks

# Tmux
install_tmux

# Vim
install_vim
