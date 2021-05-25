(module dotfiles.plugins.completion-nvim
  {require {nvim aniseed.nvim}}) 

(set nvim.g.completion_enable_snippet "vim-snippets")
(set nvim.g.completion_enable_auto_popup 1)
(nvim.ex.set "completeopt=menuone,noinsert,noselect")
(nvim.ex.set "shortmess+=c")
