#!/bin/bash

# Get the installation script directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install_vim() {
    # Clone Vundle first
    git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

    # Link .vimrc
    ln -s ${DIR}/vim/.vimrc ${HOME}

    # Link Russian-jcukenmac keymap
    mkdir -p ${HOME}/.vim/keymap
    ln -s ${DIR}/vim/.vim/keymap/russian-jcukenmac.vim \
        ${HOME}/.vim/keymap/

    # Link additional tabular commands
    mkdir -p ${HOME}/.vim/bundle/tabular/after/plugin/
    ln -s ${DIR}/vim/.vim/bundle/tabular/after/plugin/my_tabular_commands.vim \
        ${HOME}/.vim/bundle/tabular/after/plugin/

    # Link filetype definitions
    ln -s ${DIR}/vim/.vim/ftdetect ${HOME}/.vim/
}

install_tmux() {
    # Clone Tmux Plugin Manager
    git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

    # Link .tmux.conf
    ln -s ${DIR}/tmux/.tmux.conf ${HOME}
}

# Bash
ln -s ${DIR}/bash/.bash_profile ${HOME}
ln -s ${DIR}/bash/.bash_aliases ${HOME}
ln -s ${DIR}/bash/.bash_tweaks ${HOME}

# Tmux
install_tmux

# Vim
install_vim

# Python
ln -s ${DIR}/python/.pythonrc ${HOME}

# LS_COLORS
ln -s ${DIR}/dircolors-solarized/dircolors.ansi-universal ${HOME}/.dircolors
