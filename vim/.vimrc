set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color Schemes
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'mshkrebtan/vim-airline-themes'

" Features
Plugin 'godlygeek/tabular' "Vim script for text filtering and alignment.
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree' " A tree explorer plugin for vim.
Plugin 'majutsushi/tagbar'   " A class outline viewer for Vim.
Plugin 'ctrlpvim/ctrlp.vim'  " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'junegunn/goyo.vim'   " Distraction-free writing in Vim.

" Markdown
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'mzlogin/vim-markdown-toc'

" Filetype support
Plugin 'rodjek/vim-puppet'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-ruby/vim-ruby'
Plugin 'avakhov/vim-yaml'
Plugin 'nginx.vim'
Plugin 'saltstack/salt-vim'
Plugin 'davidhalter/jedi-vim' " Awesome Python autocompletion with VIM

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

" Plugin: vim-ariline
set laststatus=2
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Plugin: vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

" Plugin: vim-markdown-preview
let vim_markdown_preview_hotkey='<C-L>'
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=0
let vim_markdown_preview_browser='Safari'

" Plugin: nerdcommenter
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" Plugin: NERDTree
map <C-n> :NERDTreeToggle<CR>

" Plugin: Tagbar
nmap <F8> :TagbarToggle<CR>

" Non-plugin settings
" ================

set number

" Show which lines are wrapped in the number column
let &showbreak = '+++ '
set cpoptions+=n

" Enable the use of the mouse if really needed
"set mouse=a

" Wrap lines gracefully
set linebreak

" Enable syntax (coloring)
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Russian keymap (use C-^ to switch)
if filereadable(expand("~/.vim/keymap/russian-jcukenmac.vim"))
    set keymap=russian-jcukenmac
    " Use default keymap for insert mode and search
    set iminsert=0
    set imsearch=0
endif
highlight lCursor guifg=NONE guibg=Cyan

" Enable a colored column
if version >= 703
  set colorcolumn=80
endif

" Indentation without hard tabs
set expandtab
set shiftwidth=4
set softtabstop=4

" Comfortable backspace behaviour
set backspace=indent,eol,start

" Spell check language
set spelllang=ru_yo,en_us

" Reducing mode switching delay
set ttimeoutlen=10

" Natural splits
set splitright
set splitbelow

" Colorscheme

" If you use base16-shell, you can set any base16-vim colorscheme. The colors
" you will get are defined in base16-shell theme anyway.

" Access colors present in 256 colorspace
let base16colorspace=256

colorscheme base16-solarized-light

" Plugin: vim-airline-themes

" Use this option for solarized-like base16-shell themes:
let g:airline_base16_solarized = 1

" let g:airline_base16_improved_contrast = 1
let g:airline#themes#base16#constant = 1
let g:airline_theme='base16_shell'
