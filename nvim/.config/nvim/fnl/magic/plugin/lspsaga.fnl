(module magic.plugin.lspsaga
  {autoload {nvim aniseed.nvim
             saga lspsaga
             prov lspsaga.finder
             ca   lspsaga.codeaction
             wk   which-key}})

(saga.setup {})

(wk.register {:g {:h ["<cmd>Lspsaga lsp_finder<CR>" "LSP Finder"]}
              :c {:a ["<cmd>Lspsaga code_action<CR>" "LSP Code Actions"]}}
             {:prefix :<leader>})

(wk.register {:K ["<cmd>Lspsaga hover_doc<CR>" "Hover doc"]})

(wk.register {:c {:a ["<cmd>Lspsaga code_action<CR>" "LSP Code Actions"]}}
             {:prefix :<leader> :mode :v})
