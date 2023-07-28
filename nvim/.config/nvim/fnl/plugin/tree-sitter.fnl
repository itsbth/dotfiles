(import-macros {: module! : use-package! : fin!} :macros)

(module!)

(local ensure_installed [:javascript
                         :typescript
                         :tsx
                         :html
                         :css
                         :json
                         :toml
                         :yaml])

(use-package! :nvim-treesitter/nvim-treesitter
              {:opts {:highlight {:enable true}
		      : ensure_installed}
	       :main :nvim-treesitter.configs})

(fin!)
