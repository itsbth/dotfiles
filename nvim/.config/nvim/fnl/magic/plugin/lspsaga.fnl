(module magic.plugin.lspsaga
  {autoload {nvim aniseed.nvim
             saga lspsaga
             prov lspsaga.provider
             ca   lspsaga.codeaction
             wk which-key}})

(saga.init_lsp_saga {})

(wk.register {:g {:h [prov.lsp_finder "LSP Finder"]}}
             {:prefix :<leader>})
