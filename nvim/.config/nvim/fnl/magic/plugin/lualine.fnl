(module magic.plugin.lualine
  {autoload {nvim aniseed.nvim
             lualine lualine}})

(lualine.setup {:options {:icons_enabled true
                          :theme :palenight}
                :sections {:lualine_a [:mode]
                           :lualine_b [:branch :diff]
                           :lualine_c [:filename]
                           :lualine_x [:location]}}
               :extensions [:nvim-tree])
