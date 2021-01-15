(module dotfiles.plugins.nvim-lspconfig
  {require {lsp lspconfig 
            completion completion}})

(def- providers
  [:vimls
   :gopls
   :rust_analyzer
   :tsserver
   :pyls_ms
   :sumneko_lua])

(each [_ provider (ipairs providers)]
  ((. lsp provider :setup) {:on_attach (. completion :on_attach)}))

