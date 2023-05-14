(module magic.plugin.lspsaga
  {autoload {nvim aniseed.nvim
             saga lspsaga
             prov lspsaga.finder
             ca   lspsaga.codeaction
             wk which-key}})

(saga.setup {})

(wk.register {:g {:h [prov.lsp_finder "LSP Finder"]}
              :c {:a [ca.code_action "LSP Code Actions"]}}
             {:prefix :<leader>})

(wk.register {:c {:a [ca.range_code_action "LSP Code Actions"]}}
             {:prefix :<leader> :mode :v})
