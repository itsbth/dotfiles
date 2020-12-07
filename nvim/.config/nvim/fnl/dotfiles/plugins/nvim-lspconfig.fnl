(module dotfiles.plugins.nvim-lspconfig
  {require {lsp lspconfig}})

(def- providers
  [:gopls
   :rust_analyzer
   :tsserver
   :pyls_ms])

(each [_ provider (ipairs providers)]
  ((. lsp provider :setup)))

   
