(module dotfiles.plugins.completion-nvim
  {require {nvim aniseed.nvim}}) 

(set nvim.g.completion_enable_snippet "Ultisnips")
(nvim.ex.set "completeopt=menuone,noinsert,noselect")
(nvim.ex.set "shortmess+=c")
