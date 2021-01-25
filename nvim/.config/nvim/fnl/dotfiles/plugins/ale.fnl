(module dotfiles.plugins.ale
  {require {nvim aniseed.nvim}}) 

; only use eslint when lsp is configured
(when (. nvim.g.plugs "nvim-lspconfig")
  (let [tbl (or nvim.g.ale_linters {})]
    (tset tbl :typescript [:eslint])
    (tset tbl :typescriptreact [:eslint])
    (set nvim.g.ale_linters tbl)))
