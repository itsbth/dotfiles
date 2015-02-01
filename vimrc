set nocompatible               " be iMproved
filetype off                   " required!

let mapleader=' '

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
Plugin 'tpope/vim-repeat'


Plugin 'airblade/vim-gitgutter'
Plugin 'amdt/vim-niji'
Plugin 'AutoClose'
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'derekwyatt/vim-scala'
Plugin 'gkz/vim-ls'
Plugin 'godlygeek/tabular'
Plugin 'hexHighlight.vim'
Plugin 'honza/vim-snippets'
Plugin 'hylang/vim-hy'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'klen/python-mode'
Plugin 'leafo/moonscript-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/greper.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'SirVer/ultisnips'
Plugin 'slimv.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'carlosgaldino/elixir-snippets'
" Plugin 'Shougo/neocomplete.vim'
" ...

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" powerline
set laststatus=2
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set t_Co=256
" colorscheme Tomorrow-Night-Bright

syntax on

set number

set hidden

set tabstop=2 shiftwidth=2
set smarttab
set expandtab

set ignorecase
set smartcase
set incsearch

set autoread
set nowrap
set linebreak
if exists('+breakindent')
  set breakindent
  set showbreak=↪
  set wrap
endif
set whichwrap+=<,>,h,l

set backspace=indent,eol,start

set mouse=a

if &term =~ '256color'
  set t_ut=
endif
if has("gui_running")
  if has("gui_gtk2")
    " hide toolbar
    set guioptions-=T
    " hide menu
    set guioptions-=m
    " kill gui tabs
    set guioptions-=e
    " kill scrollbars
    set guioptions-=r
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 10
    set background=dark
    colorscheme base16-default
  endif
endif

" change cursor depending on mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Syntastic config
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1
let g:syntastic_auto_jump = 2         " Jump to syntax errors
let g:syntastic_auto_loc_list = 1     " Auto-open the error list

" Use The Silver Searcher if available
if executable('ag')
  " Use ag in CtrlP
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " Skip caching since ag is so fast
  let g:ctrlp_use_caching = 0
endif

let g:UltiSnipsExpandTrigger="<c-return>"

nmap <F8> :TagbarToggle<CR>

nmap <leader>- :source ~/.vimrc<CR>:redraw!<CR>:echo "~/.vimrc reloaded"<CR>
nmap <leader>w :w<CR>
nmap <leader>W :set invwrap<CR>:set wrap?<CR>
nmap <leader>\ gg=G``:echo "reindent global"<CR>

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab> :tabnext<CR>

" NERDTree stuff
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1
