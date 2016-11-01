#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install_vim() {
    # Install Vundle first
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Install .vimrc
    ln -s ${DIR}/vim/.vimrc ${HOME}

    # Now install the plugins
    vim +PluginInstall +qall

    # Install Russian-jcukenmac keymap
    mkdir -p ${HOME}/.vim/keymap
    ln -sf ${DIR}/vim/.vim/keymap/russian-jcukenmac.vim \
        ${HOME}/.vim/keymap/

    # Install additional tabular commands
    mkdir -p ${HOME}/.vim/bundle/tabular/after/plugin/
    ln -s ${DIR}/vim/.vim/bundle/tabular/after/plugin/my_tabular_commands.vim \
        ${HOME}/.vim/bundle/tabular/after/plugin/

    # Install filetype definitions
    ln -s ${DIR}/vim/.vim/ftdetect ${HOME}/.vim/
}

install_tmux() {
    # Install Tmux Plugin Manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Install .tmux.conf
    ln -s ${DIR}/tmux/.tmux.conf ${HOME}
}

# Bash
ln -s ${DIR}/bash/{.bash_profile,.bash_aliases,.bash_tweaks} ${HOME}

# Python
ln -s ${DIR}/python/.pythonrc ${HOME}

# Tmux
install_tmux

# Vim
install_vim
