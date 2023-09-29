(import-macros {: module! : use-package! : fin!} :macros)
(module!)

(use-package! :nvim-tree/nvim-tree.lua {:dependencies [:nvim-tree/nvim-web-devicons]
                                        :lazy false
                                        :opts {}})

(fin!)

