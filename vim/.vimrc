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
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'rodjek/vim-puppet'
Plugin 'vim-ruby/vim-ruby'
Plugin 'avakhov/vim-yaml'

Plugin 'godlygeek/tabular'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ervandew/supertab'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'             " A class outline viewer for Vim
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nginx.vim'
Plugin 'saltstack/salt-vim'

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

" Enable the use of the mouse
set mouse=a

" Enable syntax (coloring)
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Russian keymap
if filereadable(expand("~/.vim/keymap/russian-jcukenmac.vim"))
  set keymap=russian-jcukenmac
endif
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set number

" Enable a colored column
if version >= 703
  set colorcolumn=80
endif

" Wrap lines gracefully
set linebreak

" Show which lines are wrapped in the number column
let &showbreak = '+++ '
set cpoptions+=n

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

" Themes are: solarized, tomorrow, molokai, monokai,  wombat256mod, gruvbox
if $THEME == 'dark'
  let g:solarized_termcolors=256
  "colorscheme wombat256mod " Very cool!
  colorscheme gruvbox
  set background=dark
else
  set background=light
  if filereadable(expand("~/.vim/bundle/tomorrow-theme/vim/colors/Tomorrow.vim"))
    colorscheme Tomorrow
  endif
endif

" Stop the search at the end of the file.
set nowrapscan

" Filetype: gitcommit
autocmd BufRead,BufNewFile gitcommit setfiletype gitcommit
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal textwidth=72
if version >= 703
  autocmd FileType gitcommit setlocal colorcolumn=72
endif

" Filetype: markdown
autocmd FileType md,markdown setlocal spell

" Filetype: text
autocmd FileType text setlocal colorcolumn=""
autocmd FileType text setlocal spell
