(module magic.plugin.toggleterm
  {autoload {nvim aniseed.nvim
             : toggleterm}})

(toggleterm.setup {:open_mapping :<c-\>})
