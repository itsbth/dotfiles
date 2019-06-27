call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'

Plug '~/.zplugin/plugins/junegunn---fzf/' " not the greatest way to load this
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'

Plug 'w0rp/ale'

Plug 'flazz/vim-colorschemes'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
