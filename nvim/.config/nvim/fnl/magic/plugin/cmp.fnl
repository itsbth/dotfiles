(module magic.plugin.cmp
  {autoload {nvim aniseed.nvim
             : cmp
             : luasnip
             : lspkind
             sig lsp_signature
             lfv luasnip.loaders.from_vscode}})

(lspkind.init {:preset :codicons})

;; TODO: Move to LSP setup module?
(sig.setup {})

(cmp.setup {:sources [{:name :nvim_lsp}
                      ; {:name :copilot}
                      {:name :orgmode}
                      {:name :conjure}
                      {:name :path}
                      {:name :luasnip}
                      {:name :emoji}
                      {:name :buffer}]
            :formatting {:format (lspkind.cmp_format {})}
            :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
            :mapping {:<C-Space> (cmp.mapping.complete)
                      :<Tab> (cmp.mapping (fn [fallback]
                                            (if
                                              (cmp.visible) (cmp.select_next_item)
                                              (luasnip.expandable) (luasnip.expand)
                                              (luasnip.jumpable) (luasnip.jump)
                                              (fallback))) [:i :s])
                      :<S-Tab> (cmp.mapping (fn [fallback]
                                              (if
                                                (cmp.visible) (cmp.select_prev_item)
                                                (luasnip.jumpable -1) (luasnip.jump -1)
                                                (fallback))) [:i :s])
                      :<C-e> (cmp.mapping.close)
                      :<CR> (cmp.mapping.confirm {:select true})}})

(lfv.load)
