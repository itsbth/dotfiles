(module magic.plugin.treesitter
  {autoload {nvim aniseed.nvim
             treesitter nvim-treesitter.configs}})

(treesitter.setup {:ensure_installed :maintained
                   :highlight {:enable true}
                   :incremental_selection {:enable true}
                   :textobjects {:enable true}
                   :indent {:enable true :disable [:python]}
                   ; :autotag {:enable true}
                   :refactor {:enable true}})

