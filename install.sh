#!/bin/bash

# Get the installation script directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install_vim() {
    vundle_path="${HOME}/.vim/bundle/Vundle.vim"

    if [ ! -d "$vundle_path" ]; then
      # Clone Vundle first
      git clone https://github.com/VundleVim/Vundle.vim.git $vundle_path
    else
      cd $vundle_path
      git fetch origin
      git pull
    fi

    # Link .vimrc
    ln -sf ${DIR}/vim/.vimrc ${HOME}

    # Link Russian-jcukenmac keymap
    mkdir -p ${HOME}/.vim/keymap
    ln -sf ${DIR}/vim/.vim/keymap/russian-jcukenmac.vim \
        ${HOME}/.vim/keymap/

    # Link additional tabular commands
    mkdir -p ${HOME}/.vim/bundle/tabular/after/plugin/
    ln -sf ${DIR}/vim/.vim/bundle/tabular/after/plugin/my_tabular_commands.vim \
        ${HOME}/.vim/bundle/tabular/after/plugin/

    # Link filetype definitions
    ln -sf ${DIR}/vim/.vim/ftdetect ${HOME}/.vim/
}

install_tmux() {
    tmux_plugin_path="${HOME}/.tmux/plugins/tpm"

    if [ ! -d "$tmux_plugin_path" ]; then
      # Clone Tmux Plugin Manager
      git clone https://github.com/tmux-plugins/tpm $tmux_plugin_path
    else
      cd $tmux_plugin_path
      git fetch origin
      git pull
    fi

    # Link .tmux.conf
    ln -sf ${DIR}/tmux/.tmux.conf ${HOME}
}

# Bash
ln -sf ${DIR}/bash/.bash_profile ${HOME}
ln -sf ${DIR}/bash/.bash_aliases ${HOME}
ln -sf ${DIR}/bash/.bash_tweaks ${HOME}

# Git in Bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
    -o ${HOME}/.git-prompt.sh


# Base16 for Gnome Terminal
base16_terminal_parth="$HOME/.config/base16-gnome-terminal"
if [ ! -d "$base16_terminal_parth" ]; then
  git clone https://github.com/chriskempson/base16-gnome-terminal.git \
    $base16_terminal_parth
else
  cd $base16_terminal_parth
  git fetch origin
  git pull
fi

# Base16 Shell
base16_shell_path="$HOME/.config/base16-shell"
if [ ! -d "$base16_shell_path" ]; then
  git clone https://github.com/chriskempson/base16-shell.git \
    $base16_shell_path
else
  cd $base16_shell_path
  git fetch origin
  git pull
fi

# Tmux
install_tmux

# Vim
install_vim

# Python
ln -sf ${DIR}/python/.pythonrc ${HOME}
