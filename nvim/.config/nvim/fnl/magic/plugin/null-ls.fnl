(module magic.plugin.null-ls
        {autoload {nvim aniseed.nvim
                   nl null-ls
                   : lspconfig}})

(def- bi nl.builtins)
(nl.setup {:sources [bi.formatting.prettier
                     bi.formatting.shfmt
                     bi.formatting.fnlfmt

                     bi.diagnostics.shellcheck
                     bi.diagnostics.hadolint

                     bi.diagnostics.eslint]})

