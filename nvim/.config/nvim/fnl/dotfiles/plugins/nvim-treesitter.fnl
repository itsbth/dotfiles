(module dotfiles.plugins.nvim-treesitter
  {require {treesitter nvim-treesitter.configs}})

(treesitter.setup
  {"ensure_installed" "all"
   "highlight" {"enable" true}})
