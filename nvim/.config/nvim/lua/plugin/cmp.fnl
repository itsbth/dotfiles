(import-macros {: module! : use-package! : fin!} :macros)
(module!)

(fn sauce [name] {: name})

(fn config []
  (local cmp (require :cmp))
  (local lsnip (require :luasnip))
  (cmp.setup {:snippet {:expand (fn [args] (lsnip.lsp_expand args.body))}
              :mapping (cmp.mapping.preset.insert
                        {:<C-b> (cmp.mapping.scroll_docs -4)
                         :<C-F> (cmp.mapping.scroll_docs 4)
                         :<C-Space> (cmp.mapping.complete)
                         :<C-e> (cmp.mapping.abort)
                         :<CR> (cmp.mapping.confirm {:select true})})
              :sources (cmp.config.sources [(sauce :nvim_lsp) (sauce :buffer) (sauce :path) (sauce :luasnip)])}))

(use-package! :hrsh7th/nvim-cmp {:dependencies [:hrsh7th/cmp-nvim-lsp
                                                :hrsh7th/cmp-buffer
                                                :hrsh7th/cmp-path
                                                :hrsh7th/cmp-cmdline
                                                :L3MON4D3/LuaSnip
                                                :saadparwaiz1/cmp_luasnip]
                                 : config})

(fin!)
