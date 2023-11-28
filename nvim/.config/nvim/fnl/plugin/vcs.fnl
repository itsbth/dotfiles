(import-macros {: module! : use-package! : fin!} :macros)
(module!)

(use-package! :NeogitOrg/neogit
        {:dependencies [:nvim-lua/plenary.nvim :sindrets/diffview.nvim]
         :config true})

(fin!)

