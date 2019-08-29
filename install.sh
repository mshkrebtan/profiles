#!/bin/bash
set +e

# Get the installation script directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install_vim() {
    # Clone Vundle first
    git clone https://github.com/VundleVim/Vundle.vim.git \
        ${HOME}/.vim/bundle/Vundle.vim

    # Link .vimrc
    ln -s ${DIR}/vim/.vimrc ${HOME}

    # Link filetype definitions
    mkdir -p "${HOME}/.vim/after"
    ln -s "${DIR}/vim/.vim/after/ftplugin" "${HOME}/.vim/after"
}

install_tmux() {
    # Clone Tmux Plugin Manager
    git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

    # Link .tmux.conf
    ln -s ${DIR}/tmux/.tmux.conf ${HOME}
}

# Bash
ln -s ${DIR}/bash/.bashrc ${HOME}
ln -s ${DIR}/bash/.bash_profile ${HOME}
ln -s ${DIR}/bash/.bash_aliases ${HOME}
ln -s ${DIR}/bash/.bash_tweaks ${HOME}

# Git in Bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
    -o ${HOME}/.git-prompt.sh

# Base16 Shell
git clone https://github.com/chriskempson/base16-shell.git \
    $HOME/.config/base16-shell

# Tmux
install_tmux

# Vim
install_vim
