(module dotfiles.plugins.nvim-lspconfig
  {require {lsp nvim_lsp}})

(def- providers
  [:gopls
   :rust_analyzer
   :tsserver])

(each [_ provider (ipairs providers)]
  ((. lsp provider :setup)))

   
