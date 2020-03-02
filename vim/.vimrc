if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Color Schemes
Plug 'morhetz/gruvbox'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Top features
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'ntpeters/vim-better-whitespace'

" Filetype support
Plug 'hashivim/vim-hashicorp-tools'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'

" The rest
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/UniCycle'
Plug 'liuchengxu/graphviz.vim'

" Initialize plugin system
call plug#end()

" Plugin: vim-ariline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':p:~:.'

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

" Colorscheme
" -----------------------------------------------------------------------------
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  set hlsearch
endif

" Set colorscheme
colorscheme gruvbox
set background=light

" Plugin: gruvbox
let g:gruvbox_contrast_light="hard"
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_number_column="bg1"

" Plugin: vim-airline-themes
let g:airline_theme='gruvbox'
" -----------------------------------------------------------------------------
" end Colorscheme

" Non-plugin settings
" -----------------------------------------------------------------------------
syntax on
set backspace=indent,eol,start
set completeopt=menu,preview,longest
set wildmode=longest,list
set wildmenu
set expandtab
" :help russian-keymap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set incsearch
set nowrapscan
set number
set spelllang=ru_yo,en_us
set splitbelow
set splitright
" Set textwidth and colorcolumn
set textwidth=78
set colorcolumn=79
" Reducing mode switching delay
set ttimeout
set ttimeoutlen=10
" Show tabs
set list
set listchars=tab:>-,trail:-

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

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
