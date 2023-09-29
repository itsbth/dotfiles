(import-macros {: module! : use-package! : fin!} :macros)
(module!)

; NB: nvim-lspconfig should load *after* mason-lspconfig
(use-package! :williamboman/mason.nvim {:opts {}})
(use-package! :williamboman/mason-lspconfig.nvim {:dependencies [:williamboman/mason.nvim]
                                                  :opts {:ensure_installed [:lua_ls]}
                                                  :setup (fn [opts] (let [mlspc (require :mason-lspconfig)]
                                                                     (mlspc.setup opts)
                                                                     (mlspc.setup_handlers {})))})
(use-package! :neovim/nvim-lspconfig {:dependencies [:williamboman/mason-lspconfig.nvim]})

(fin!)
