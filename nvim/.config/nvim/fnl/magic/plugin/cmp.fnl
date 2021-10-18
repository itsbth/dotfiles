(module magic.plugin.cmp
  {autoload {nvim aniseed.nvim
             : cmp
             : luasnip}})

(cmp.setup {:sources [{:name :nvim_lsp}
                      {:name :conjure}
                      {:name :path}
                      {:name :luasnip}
                      {:name :buffer}]
            :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
            :mapping {:<C-Space> (cmp.mapping.complete)
                      :<C-e> (cmp.mapping.close)
                      :<CR> (cmp.mapping.confirm {:select true})}})

