set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'wombat256.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'rodjek/vim-puppet'
Plugin 'godlygeek/tabular'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" colors
colorscheme Tomorrow
"colorscheme wombat256mod
"colorscheme solarized
set background=light
let g:solarized_termcolors=256

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" vim-ariline
set laststatus=2
let g:airline_powerline_fonts = 1

" Russian keymap
set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set number
set spelllang=ru_yo,en_us

set ttimeoutlen=10
