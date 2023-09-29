(import-macros {: module! : use-package! : fin!} :macros)

(fn key [key action opts]
    (tset opts 1 key)
    (tset opts 2 action)
    opts)

(module!)

(use-package! :nvim-telescope/telescope.nvim
              {:dependencies [:nvim-lua/plenary.nvim] :opts {}
               :cmd :Telescope
               :keys [(key :<leader>ff "<cmd>Telescope find_files hidden=true<cr>" {:desc "Find Files"})]}) 
                                                             

(fin!)
