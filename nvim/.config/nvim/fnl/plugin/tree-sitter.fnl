(import-macros {: module! : use-package! : fin!} :macros)

(module!)

(local ensure_installed [:javascript
                         :typescript
                         :fennel
                         :tsx
                         :html
                         :css
                         :json
                         :toml
                         :yaml])

(use-package! :nvim-treesitter/nvim-treesitter
              {:opts {:highlight {:enable true}
                      :incremental_selection {:enable true}
                      :textobjects {:enable true}
                      :indent {:enable true :disable [:python]}
                      : ensure_installed}
               :main :nvim-treesitter.configs})

(fin!)
