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

; (nvim.ex.set :spell)
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
  ; load first for big speed
  :lewis6991/impatient.nvim {}
  ;; FENNEL
  :Olical/aniseed {:version "v3.31.*"}
  :Olical/conjure {:version "v4.40.*"}
  :Olical/nvim-local-fennel {:version "v2.19.*"}

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
  ; :jiangmiao/auto-pairs {:mod :auto-pairs}
  :junegunn/fzf {}
  :junegunn/fzf.vim {}
  :liuchengxu/vim-better-default {:mod :better-default}
  :mbbill/undotree {}
  :radenling/vim-dispatch-neovim {}
  ; :srcery-colors/srcery-vim {:mod :srcery}
  ; :tami5/compe-conjure {}
  :tpope/vim-abolish {}
  ; :tpope/vim-commentary {}
  :tpope/vim-dispatch {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {}
  :tpope/vim-rhubarb {}
  :shumphrey/fugitive-gitlab.vim {}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  ; :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  ; :w0rp/ale {:mod :ale} ; replaced by null-ls
  ;; :wbthomason/packer.nvim {}

  ;; MINI (misc utilities)
  :echasnovski/mini.nvim {:mod :mini}

  ;; IMPRTNT
  ; best(?) editorconfig plugin
  :gpanders/editorconfig.nvim {}

  ;; CMPLETION
  :hrsh7th/cmp-path {}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-emoji {}
  :PaterJason/cmp-conjure {}
  ; some lsp servers (looking at you, rust_analyzer) requires snippets
  :L3MON4D3/LuaSnip {}
  :saadparwaiz1/cmp_luasnip {}
  :rafamadriz/friendly-snippets {}
  ; icons
  :onsails/lspkind.nvim {}
  :ray-x/lsp_signature.nvim {}
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim" {}

  ;; TREESITTER
  ; y u no sit in trees
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  ; pest removal helper
  :nvim-treesitter/playground {}
  ; 🌈
  :p00f/nvim-ts-rainbow {}

  ;; LSP
  ; automatically configure lsp clients
  :neovim/nvim-lspconfig {}
  ; install 'em
  ; :williamboman/nvim-lsp-installer {:mod :lspinfo}
  :williamboman/mason.nvim {:mod :mason}
  :williamboman/mason-lspconfig.nvim {}
  ; better lsp
  :glepnir/lspsaga.nvim {:mod :lspsaga}
  ; fix missing colors
  :folke/lsp-colors.nvim {}
  ; does stuff
  :folke/trouble.nvim {:mod :trouble}
  ; "fake" server
  :jose-elias-alvarez/null-ls.nvim {:mod :null-ls}
  ; status line helpers
  :nvim-lua/lsp-status.nvim {}
  ; symbols
  :simrat39/symbols-outline.nvim {}
  ; status
  :j-hui/fidget.nvim {:config (setup! fidget)}

  ; motion sickness
  :ggandor/lightspeed.nvim {}

  ;; i swear it's not emacs
  :kristijanhusak/orgmode.nvim {:mod :org-mode}
  :akinsho/org-bullets.nvim {}
  :lukas-reineke/headlines.nvim {}
  :michaelb/sniprun {:run "nix shell nixpkgs#cargo -c bash ./install.sh"}

  ;; git lost
  :TimUntersberger/neogit {:config (setup! neogit)}

  ;; UI
  ; distraction-free editing
  :folke/twilight.nvim {:mod :twilight}
  :folke/zen-mode.nvim {:mod :zen}

  ;; SESSION
  :rmagatti/auto-session {:mod :auto-session}
  :rmagatti/session-lens {}

  ;; MISC, need to categorize
  ; pretty colours
  :folke/tokyonight.nvim {}
  ; weeby colours
  :doki-theme/doki-theme-vim {}
  ; catty colours (currently disabled as it breaks other schemes)
  ; :catppuccin/nvim {:as :catppuccin :mod :catppuccin}
  ; rosy colours
  :rose-pine/neovim {:name :rose-pine}
  ; wavy colours
  :rebelot/kanagawa.nvim {}
  ; pretty icons
  :kyazdani42/nvim-web-devicons {:mod :devicons}
  ; can't live without parinfer -- let's try a pure lua variant
  :gpanders/nvim-parinfer {}
  ; where are my files
  :kyazdani42/nvim-tree.lua {:mod :nvim-tree}
  ; how do i get to my files
  :nvim-telescope/telescope.nvim {:dependencies [:nvim-lua/plenary.nvim]
                                  :mod :telescope}
  :nvim-telescope/telescope-fzf-native.nvim {:run :make}
  ; vim.ui.* improvements
  :stevearc/dressing.nvim {}
  ; notifications
  :rcarriga/nvim-notify {:config  #(set vim.notify (require :notify))}
  ; dashboard test
  ; :glepnir/dashboard-nvim {:mod :dashboard}
  :startup-nvim/startup.nvim {:mod :startup}
  ; 🐈bar
  ; :feline-nvim/feline.nvim {:mod :feline}
  ; :nvim-lualine/lualine.nvim {:mod :lualine}
  ; 🧠
  ; :glepnir/galaxyline.nvim {:mod :galaxyline}
  ; line
  ; :windwp/windline.nvim {:mod :windline}
  ; 💇line
  :rebelot/heirline.nvim {:mod :heirline}
  ; bufferline (because i can't remember what i have open)
  :akinsho/bufferline.nvim {:mod :bufferline}
  ; git gutter++
  :lewis6991/gitsigns.nvim {:dependencies [:nvim-lua/plenary.nvim]
                            :config (setup! gitsigns)}
  ; tree-sitter powered status segment
  :SmiteshP/nvim-gps {}
  ; fine farger
  :norcalli/nvim-colorizer.lua {}
  ; go back
  :farmergreg/vim-lastplace {}
  ; debugging
  :mfussenegger/nvim-dap {}

  ; nvim <pre><tab><cr>
  :mong8se/actually.nvim {}

  ;; TERM
  ; :akinsho/toggleterm.nvim {:tag "v2.*" :config #((. (require :toggleterm) :setup) {:open_mapping :<c-\>})}
  :akinsho/toggleterm.nvim {:version "v2.*" :mod :toggleterm}

  ;; languages
  ; markdown
  :ellisonleao/glow.nvim {}; glow-powered markdown preview
  ; json
  :b0o/schemastore.nvim {}
  ; fsharp
  :ionide/Ionide-vim {:run "make fsautocomplete"}
  ; very very very wip, remove after testing
  ; :github/copilot.vim {}
  ; :hrsh7th/cmp-copilot {})
  ; earthly
  :earthly/earthly.vim {})


; (set vim.g.copilot_no_tab_map true)
; (set vim.g.copilot_assume_mapped true)

; (augroup highlight_yank
;    (nvim.ex.autocmd
;      :TextYankPost "*" "lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }"))

; Hm...
(augroup! highlight_yank
          :TextYankPost {:callback #(vim.highlight.on_yank {:higroup :IncSearch :timeout 200})})

(nvim.ex.colorscheme :rose-pine)
