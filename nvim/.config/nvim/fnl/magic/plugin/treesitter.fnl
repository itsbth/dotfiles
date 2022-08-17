(module magic.plugin.treesitter
  {autoload {nvim aniseed.nvim
             treesitter nvim-treesitter.configs}})

(def- ensure_installed [:javascript :typescript :json :yaml :python :lua :fennel])

(treesitter.setup {: ensure_installed
                   :highlight {:enable true}
                   :incremental_selection {:enable true}
                   :textobjects {:enable true}
                   :indent {:enable true :disable [:python]}
                   :autotag {:enable true}
                   :refactor {:enable true}
                   :rainbow {:enable true}})

