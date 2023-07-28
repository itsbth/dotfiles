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

(countdown!)

;; TODO: Break out into separate files

; load first for big speed
(use-package! :lewis6991/impatient.nvim)
;; FENNEL
(use-package! :Olical/aniseed {:version "v3.33.*"})
(use-package! :Olical/conjure {:version "v4.44.*"})
(use-package! :Olical/nvim-local-fennel {:version "v2.19.*"})

;; MISC FROM MAGIC-KIT, to be evaluated and categorized
(use-package! :PeterRincker/vim-argumentative)
;(use-package! :airblade/vim-gitgutter)
(use-package! :clojure-vim/clojure.vim)
(use-package! :clojure-vim/vim-jack-in)
(use-package! :easymotion/vim-easymotion)
(use-package! :folke/which-key.nvim {:mod :which-key})
(use-package! :guns/vim-sexp)
(use-package! :hrsh7th/nvim-cmp {:mod :cmp})
;(use-package! :itchyny/lightline.vim)
;(use-package! :jiangmiao/auto-pairs {:mod :auto-pairs})
(use-package! :junegunn/fzf)
(use-package! :junegunn/fzf.vim)
(use-package! :liuchengxu/vim-better-default {:mod :better-default})
(use-package! :mbbill/undotree)
(use-package! :radenling/vim-dispatch-neovim)
;(use-package! :srcery-colors/srcery-vim {:mod :srcery})
;(use-package! :tami5/compe-conjure)
(use-package! :tpope/vim-abolish)
;(use-package! :tpope/vim-commentary)
(use-package! :tpope/vim-dispatch)
(use-package! :tpope/vim-eunuch)
(use-package! :tpope/vim-fugitive)
(use-package! :tpope/vim-rhubarb)
(use-package! :shumphrey/fugitive-gitlab.vim)
(use-package! :tpope/vim-repeat)
(use-package! :tpope/vim-sexp-mappings-for-regular-people)
(use-package! :tpope/vim-sleuth)
;(use-package! :tpope/vim-surround)
(use-package! :tpope/vim-unimpaired)
(use-package! :tpope/vim-vinegar)
;(use-package! :w0rp/ale {:mod :ale}) ; replaced by null-ls
; (use-package! :wbthomason/packer.nvim)

;; MINI (misc utilities)
(use-package! :echasnovski/mini.nvim {:mod :mini})

;; IMPRTNT
; best(?) editorconfig plugin
(use-package! :gpanders/editorconfig.nvim)

;; CMPLETION
(use-package! :hrsh7th/cmp-path)
(use-package! :hrsh7th/cmp-buffer)
(use-package! :hrsh7th/cmp-nvim-lsp)
(use-package! :hrsh7th/cmp-emoji)
(use-package! :PaterJason/cmp-conjure)
; some lsp servers (looking at you, rust_analyzer) dependencies snippets
(use-package! :L3MON4D3/LuaSnip)
(use-package! :saadparwaiz1/cmp_luasnip)
(use-package! :rafamadriz/friendly-snippets)
; icons
(use-package! :onsails/lspkind.nvim)
(use-package! :ray-x/lsp_signature.nvim)
(use-package! "https://git.sr.ht/~whynothugo/lsp_lines.nvim")

;; TREESITTER
; y u no sit in trees
(use-package! :nvim-treesitter/nvim-treesitter {:mod :treesitter})
; pest removal helper
(use-package! :nvim-treesitter/playground)
; 🌈
(use-package! :p00f/nvim-ts-rainbow)

;; LSP
; automatically configure lsp clients
(use-package! :neovim/nvim-lspconfig)
; install 'em
;(use-package! :williamboman/nvim-lsp-installer {:mod :lspinfo})
(use-package! :williamboman/mason.nvim {:mod :mason})
(use-package! :williamboman/mason-lspconfig.nvim)
; better lsp
(use-package! :nvimdev/lspsaga.nvim {:mod :lspsaga})
; fix missing colors
(use-package! :folke/lsp-colors.nvim)
; does stuff
(use-package! :folke/trouble.nvim {:mod :trouble})
; "fake" server
(use-package! :jose-elias-alvarez/null-ls.nvim {:mod :null-ls})
; status line helpers
(use-package! :nvim-lua/lsp-status.nvim)
; symbols
(use-package! :simrat39/symbols-outline.nvim)
; status
(use-package! :j-hui/fidget.nvim {:version :legacy :config (setup! fidget)})

; motion sickness
(use-package! :ggandor/lightspeed.nvim)

;; i swear it's not emacs
(use-package! :nvim-orgmode/orgmode.nvim {:mod :org-mode})
(use-package! :akinsho/org-bullets.nvim)
(use-package! :lukas-reineke/headlines.nvim)
(use-package! :michaelb/sniprun {:build "nix shell nixpkgs#cargo -c bash ./install.sh"})

;; git lost
(use-package! :NeogitOrg/neogit {:config (setup! neogit)})

;; UI
; distraction-free editing
(use-package! :folke/twilight.nvim {:mod :twilight})
(use-package! :folke/zen-mode.nvim {:mod :zen})

;; SESSION
(use-package! :rmagatti/auto-session {:mod :auto-session})
(use-package! :rmagatti/session-lens)

; broken, path is wrong. do i have to abandon aniseed?
;(include :magic.colors)
; (include (.. ... :.colors))
;; MISC, need to categorize
; pretty colours
(use-package! :folke/tokyonight.nvim)
; weeby colours
(use-package! :doki-theme/doki-theme-vim)
; catty colours (currently disabled as it breaks other schemes)
;(use-package! :catppuccin/nvim {:as :catppuccin :mod :catppuccin})
; rosy colours
(use-package! :rose-pine/neovim {:name :rose-pine})
; wavy colours
(use-package! :rebelot/kanagawa.nvim)
; retro colors
(use-package! :maxmx03/fluoromachine.nvim {:config (setup! fluoromachine {:glow true})})
; pretty icons
(use-package! :nvim-tree/nvim-web-devicons {:mod :devicons})
; can't live without parinfer -- let's try a pure lua variant
(use-package! :gpanders/nvim-parinfer)
; where are my files
(use-package! :nvim-tree/nvim-tree.lua {:mod :nvim-tree})
; how do i get to my files
(use-package! :nvim-telescope/telescope.nvim {:dependencies [:nvim-lua/plenary.nvim]
                                              :mod :telescope})
;; (use-package! :nvim-telescope/telescope-fzf-native.nvim {:run :make})
; vim.ui.* improvements
(use-package! :stevearc/dressing.nvim)
; notifications
(use-package! :rcarriga/nvim-notify {:config  #(set vim.notify (require :notify))})
; dashboard test
;(use-package! :glepnir/dashboard-nvim {:mod :dashboard})
(use-package! :startup-nvim/startup.nvim {:mod :startup})
; 🐈bar
;(use-package! :feline-nvim/feline.nvim {:mod :feline})
;(use-package! :nvim-lualine/lualine.nvim {:mod :lualine})
; 🧠
;(use-package! :glepnir/galaxyline.nvim {:mod :galaxyline})
; 🎐line
;(use-package! :windwp/windline.nvim {:mod :windline})
; 💇line
(use-package! :rebelot/heirline.nvim {:mod :heirline})
; bufferline (because i can't remember what i have open)
(use-package! :akinsho/bufferline.nvim {:mod :bufferline})
; git gutter++
(use-package! :lewis6991/gitsigns.nvim {:dependencies [:nvim-lua/plenary.nvim]
                                        :config (setup! gitsigns)})
; tree-sitter powered status segment
(use-package! :SmiteshP/nvim-gps)
; fine farger
(use-package! :norcalli/nvim-colorizer.lua)
; go back
(use-package! :farmergreg/vim-lastplace)
; debugging
(use-package! :mfussenegger/nvim-dap)

; nvim <pre><tab><cr>
(use-package! :mong8se/actually.nvim)

;; TERM
;(use-package! :akinsho/toggleterm.nvim {:tag "v2.*" :config #((. (require :toggleterm) :setup) {:open_mapping :<c-\>})})
(use-package! :akinsho/toggleterm.nvim {:version "v2.*" :mod :toggleterm})

;; languages
; markdown
(use-package! :ellisonleao/glow.nvim)
; json
(use-package! :b0o/schemastore.nvim)
; fsharp
(use-package! :ionide/Ionide-vim {:build "make fsautocomplete"})
; very very very wip, remove after testing
;(use-package! :github/copilot.vim)
;(use-package! :hrsh7th/cmp-copilot))
; earthly
(use-package! :earthly/earthly.vim)

(liftoff!)


; (set vim.g.copilot_no_tab_map true)
; (set vim.g.copilot_assume_mapped true)

; (augroup highlight_yank
;    (nvim.ex.autocmd
;      :TextYankPost "*" "lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }"))

; Hm...
(augroup! highlight_yank
          :TextYankPost {:callback #(vim.highlight.on_yank {:higroup :IncSearch :timeout 200})})

(nvim.ex.colorscheme :rose-pine)
