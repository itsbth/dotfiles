(module magic.init
  {autoload {plugin magic.plugin
             nvim aniseed.nvim}
   require-macros [magic.macros]})

;;; Introduction

;; Aniseed compiles this (and all other Fennel files under fnl) into the lua
;; directory. The init.lua file is configured to load this file when ready.

;; We'll use modules, macros and functions to define our configuration and
;; required plugins. We can use Aniseed to evaluate code as we edit it or just
;; restart Neovim.

;; You can learn all about Conjure and how to evaluate things by executing
;; :ConjureSchool in your Neovim. This will launch an interactive tutorial.


;;; Generic configuration

(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)

(nvim.ex.set :spell)
(nvim.ex.set :list)
(nvim.ex.set :title)

;;; Mappings

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")


;;; Plugins

;; TODO: Organize better

;; Run script/sync.sh to update, install and clean your plugins.
;; Packer configuration format: https://github.com/wbthomason/packer.nvim
(plugin.use
  ;; FENNEL
  :Olical/aniseed {:tag "v3.23.0"}
  :Olical/conjure {:tag "v4.25.0"}

  ;; MISC FROM MAGIC-KIT, to be evaluated and categorized
  :PeterRincker/vim-argumentative {}
  ; :airblade/vim-gitgutter {}
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  :easymotion/vim-easymotion {}
  :folke/which-key.nvim {:mod :which-key}
  :guns/vim-sexp {}
  :hrsh7th/nvim-cmp {:mod :cmp}
  ; :itchyny/lightline.vim {}
  :jiangmiao/auto-pairs {:mod :auto-pairs}
  :junegunn/fzf {}
  :junegunn/fzf.vim {}
  :liuchengxu/vim-better-default {:mod :better-default}
  :mbbill/undotree {}
  :radenling/vim-dispatch-neovim {}
  ; :srcery-colors/srcery-vim {:mod :srcery}
  ; :tami5/compe-conjure {}
  :PaterJason/cmp-conjure {}
  :tpope/vim-abolish {}
  :tpope/vim-commentary {}
  :tpope/vim-dispatch {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  ; :w0rp/ale {:mod :ale} ; replaced by null-ls
  :wbthomason/packer.nvim {}

  ;; CMPLETION
  :hrsh7th/cmp-path {}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-nvim-lsp {}
  ; some lsp servers (looking at you, rust_analyzer) requires snippets
  :L3MON4D3/LuaSnip {}
  :saadparwaiz1/cmp_luasnip {}

  ;; TREESITTER
  ; y u no sit in trees
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  ; pest removal helper
  :nvim-treesitter/playground {}

  ;; LSP
  ; automatically configure lsp clients
  :neovim/nvim-lspconfig {}
  ; install 'em
  :williamboman/nvim-lsp-installer {:mod :lspinfo}
  ; better lsp
  :tami5/lspsaga.nvim {:mod :lspsaga :branch :nvim51}
  ; fix missing colors
  :folke/lsp-colors.nvim {}
  ; does stuff
  :folke/trouble.nvim {:mod :trouble}
  ; "fake" server
  :jose-elias-alvarez/null-ls.nvim {:mod :null-ls}
  ; status line helpers
  :nvim-lua/lsp-status.nvim {}

  ;; MISC, need to categorize
  ; pretty colours
  :folke/tokyonight.nvim {:mod :tokyonight}
  ; weeby colours
  :doki-theme/doki-theme-vim {}
  ; pretty icons
  :kyazdani42/nvim-web-devicons {:mod :devicons}
  ; can't live without parinfer -- let's try a pure lua variant
  :gpanders/nvim-parinfer {}
  ; where are my files
  :kyazdani42/nvim-tree.lua {:mod :nvim-tree}
  ; how do i get to my files
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/plenary.nvim]
                                  :mod :telescope}
  ; dashboard test
  ; :glepnir/dashboard-nvim {:mod :dashboard}
  ; 🐈bar
  :famiu/feline.nvim {:mod :feline}
  ; :shadmansaleh/lualine.nvim {:mod :lualine})
  ; 🧠
  ; :glepnir/galaxyline.nvim {:mod :galaxyline}
  ; bufferline (because i can't remember what i have open)
  :akinsho/bufferline.nvim {:mod :bufferline}
  ; git gutter++
  :lewis6991/gitsigns.nvim {:requires [:nvim-lua/plenary.nvim]
                            :config (fn [] (let [gs (require :gitsigns)] (gs.setup)))}
  ; fine farger
  :norcalli/nvim-colorizer.lua {}
  ; go back
  :farmergreg/vim-lastplace {}
  ; debugging
  :mfussenegger/nvim-dap {}
  
  ;; languages
  ; markdown
  :ellisonleao/glow.nvim {}); glow-powered markdown preview

(augroup highlight_yank
   (nvim.ex.autocmd
     :TextYankPost "*" "lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }"))
