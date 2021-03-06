call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'tweekmonster/startuptime.vim'

" fennel (lisp-variant) conf support
Plug 'Olical/aniseed', { 'tag': 'v3.18.0' }
Plug 'bakpakin/fennel.vim'
Plug 'Olical/conjure'

Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

" start page
Plug 'mhinz/vim-startify'

" git and github support
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" and gitlab
Plug 'shumphrey/fugitive-gitlab.vim'

" changed lines in gutter
Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-signify'

" Rainbow parentheses
Plug 'kien/rainbow_parentheses.vim'

Plug '~/.zinit/plugins/junegunn---fzf/' " not the greatest way to load this
Plug 'junegunn/fzf.vim'

" Buffer navigation
Plug 'mildred/vim-bufmru'


" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-endwise' " overlaps with pear-tree
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

Plug 'PeterRincker/vim-argumentative'

" remember cursor position
Plug 'farmergreg/vim-lastplace'

" brace pairing(++)
Plug 'tmsvg/pear-tree'

" linting
Plug 'w0rp/ale'

" formatting
Plug 'sbdchd/neoformat'

" lsp providers
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" lsp (alt 2)
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete-lsp'

" Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'

Plug 'nvim-lua/lsp_extensions.nvim'

" Plug 'ervandew/supertab'

Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'tjdevries/colorbuddy.nvim'
Plug 'rockerBOO/boo-colorscheme-nvim'
Plug 'sainnhe/edge'
" nothing to see here, move along
Plug 'doki-theme/doki-theme-vim'
Plug 'deviantfero/wpgtk.vim'

Plug 'ryanoasis/vim-devicons'

" briefly highlight yanked text
Plug 'machakann/vim-highlightedyank'

" remember colourscheme
" Plug 'rojspencer/vim-colorminder' " extremely slow for some reason

" snippety snip
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" distraction-free editing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'


Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" thing picker
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" thing picker extensions
Plug 'nvim-telescope/telescope-ghq.nvim'
Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'


" LSP/tags viewer
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
" Plug 'reasonml-editor/vim-reason-plus'

" jsonnet
Plug 'google/vim-jsonnet'

" hy(lang)
Plug 'hylang/vim-hy'

" terraform
Plug 'hashivim/vim-terraform'

" take of every
Plug 'ziglang/zig.vim'

" rust
Plug 'simrat39/rust-tools.nvim'

call plug#end()
