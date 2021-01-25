(module dotfiles.plugins.completion-nvim
  {require {nvim aniseed.nvim}}) 


(let [tbl (or nvim.g.conjure#filetype_client {})]
  (tset tbl :hy "dotfiles.cj-clients.hylang")
  (set nvim.g.conjure#filetype_client tbl))
