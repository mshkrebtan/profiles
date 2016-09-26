#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Vim
# Install Vundle first
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ${DIR}/vim/.vimrc ${HOME}

# Now install the plugins
vim +PluginInstall +qall

# Finally, create symlinks
mkdir -p ${HOME}/.vim/keymap
mkdir -p ${HOME}/.vim/ftdetect
mkdir -p ${HOME}/.vim/bundle/tabular/after/plugin/

ln -sf ${DIR}/vim/.vim/keymap/russian-jcukenmac.vim \
	${HOME}/.vim/keymap
ln -s ${DIR}/vim/.vim/bundle/tabular/after/plugin/my_tabular_commands.vim \
	${HOME}/.vim/bundle/tabular/after/plugin

ln -s ~/.profiles/vim/.vim/ftdetect/* ~/.vim/ftdetect/

# Tmux
ln -s ${DIR}/tmux/{.tmux,.tmux.conf} ${HOME}

# Bash
ln -s ${DIR}/bash/.bashrc ${HOME}/.bashrc
ln -s ${DIR}/bash/{.bash_profile,.bash_aliases} ${HOME}

# Python
ln -s ${DIR}/python/.pythonrc ${HOME}
