call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'itchyny/lightline.vim'

Plug 'mhinz/vim-startify'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug '~/.zinit/plugins/junegunn---fzf/' " not the greatest way to load this
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'

Plug 'farmergreg/vim-lastplace'

Plug 'tmsvg/pear-tree'

Plug 'w0rp/ale'

" lsp providers
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" lsp (alt 2)
Plug 'neovim/nvim-lsp'
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

" langs
" ts
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Quramy/tsuquyomi'

" raku
Plug 'Raku/vim-raku'

call plug#end()
