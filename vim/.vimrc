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

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Top features
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'ntpeters/vim-better-whitespace'

" Filetype support
Plugin 'hashivim/vim-hashicorp-tools'
Plugin 'stephpy/vim-yaml'
Plugin 'plasticboy/vim-markdown'
Plugin 'nginx.vim'
Plugin 'saltstack/salt-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'

" The rest
Plugin 'majutsushi/tagbar'
Plugin 'UniCycle'
Plugin 'liuchengxu/graphviz.vim'

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
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':p:~:.'

" Plugin: vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

" Plugin: nerdcommenter
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" Plugin: Tagbar
nmap <F8> :TagbarToggle<CR>

" Plugin: ctrlp
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'results:20'
let g:ctrlp_extensions = ['dir']
if executable('rg')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'rg --files --no-ignore --ignore-file ~/.config/ripgrep/ignore --hidden %s'
endif

" Plugin: Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-ignore --ignore-file ~/.config/ripgrep/ignore --hidden'
endif

" Plugin: base16-vim
let base16colorspace=256
" If you use base16-shell, you can set any base16-vim colorscheme. The colors
" you will get are defined in base16-shell theme anyway.
colorscheme base16-solarized-light

" Plugin: vim-airline-themes
" Use this option for solarized-like base16-shell themes:
let g:airline_base16_solarized = 1
" Use this option for other base16-shell themes to get brighter colors:
" let g:airline_base16_improved_contrast = 1
let g:airline_theme='base16_shell'

" Non-plugin settings
" ===================
syntax on
set backspace=indent,eol,start
set completeopt=menu,preview,longest
set tabstop=4
" :help russian-keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set nowrapscan
set number
set spelllang=ru_yo,en_us
set splitbelow
set splitright
" Set textwidth and colorcolumn
set textwidth=79
set colorcolumn=80
" Reducing mode switching delay
set ttimeoutlen=10

" List formatting
" -----------------------------------------------------------------------------
set autoindent
" When formatting text, recognize numbered lists
setlocal formatoptions+=n
" Adjust the default numbered list formatlistpat to include dash and bullet
" lists
set formatlistpat=^\\s*[-*0-9]\\+[\]:.)}\\t\ ]\\s*
" -----------------------------------------------------------------------------
" end List formatting
