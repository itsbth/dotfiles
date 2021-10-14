(module magic.plugin.cmp
  {autoload {nvim aniseed.nvim
             cmp cmp}})

(cmp.setup {:sources [{:name :nvim_lsp}
                      {:name :path}
                      {:name :conjure}
                      {:name :buffer}]
                      
            :mapping {:<C-Space> (cmp.mapping.complete)
                      :<C-e> (cmp.mapping.close)
                      :<CR> (cmp.mapping.confirm {:select true})}})

