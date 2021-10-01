(module magic.plugin.treesitter
  {autoload {nvim aniseed.nvim
             treesitter nvim-treesitter.configs}})

(treesitter.setup {:ensure_installed :maintained})
                   
                   
