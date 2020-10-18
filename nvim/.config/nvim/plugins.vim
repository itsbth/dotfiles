call plug#begin()
Plug 'tpope/vim-sensible'

" fennel (lisp-variant) conf support
Plug 'Olical/aniseed', { 'tag': 'v3.9.0' }
Plug 'bakpakin/fennel.vim'
Plug 'Olical/conjure'

Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

Plug 'mhinz/vim-startify'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

Plug '~/.zinit/plugins/junegunn---fzf/' " not the greatest way to load this
Plug 'junegunn/fzf.vim'

" Buffer navigation
Plug 'mildred/vim-bufmru'


Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

Plug 'farmergreg/vim-lastplace'

Plug 'tmsvg/pear-tree'

Plug 'w0rp/ale'

Plug 'sbdchd/neoformat'

" lsp providers
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" lsp (alt 2)
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'

Plug 'ervandew/supertab'


Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'rojspencer/vim-colorminder'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'


Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

Plug 'liuchengxu/vista.vim'

Plug 'eraserhd/parinfer-rust', { 'do': 'cargo build --release' }

" better syntax highlighting (nvim 0.5 nightly)
Plug 'nvim-treesitter/nvim-treesitter'

" langs
" ts
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Quramy/tsuquyomi'

" raku
Plug 'Raku/vim-raku'

" nginx config
Plug 'chr4/nginx.vim'

" reason
Plug 'reasonml-editor/vim-reason-plus'

" jsonnet
Plug 'google/vim-jsonnet'

call plug#end()
