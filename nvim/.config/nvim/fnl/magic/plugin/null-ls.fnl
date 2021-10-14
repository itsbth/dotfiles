(module magic.plugin.null-ls
  {autoload {nvim aniseed.nvim
             nl null-ls
             : lspconfig}})

(def- bi nl.builtins)
(nl.config {:sources [bi.formatting.prettier
                      bi.formatting.shfmt
                      
                      bi.diagnostics.shellcheck]})

(lspconfig.null-ls.setup {})
