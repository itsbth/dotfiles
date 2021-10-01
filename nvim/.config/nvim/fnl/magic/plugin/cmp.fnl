(module magic.plugin.cmp
  {autoload {nvim aniseed.nvim
             cmp cmp}})

(cmp.setup {:sources [{:name :nvim_lsp}
                      {:name :conjure}]})

