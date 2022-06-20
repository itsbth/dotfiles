(module magic.plugin.lualine
  {autoload {nvim aniseed.nvim
             lualine lualine
             gps nvim-gps}})

(gps.setup {})

(lualine.setup {:options {:icons_enabled true
                          :theme :auto
                          :globalstatus true}
                :sections {:lualine_a [:mode]
                           :lualine_b [:branch :diff :diagnostics]
                           :lualine_c [:filename]
                           :lualine_x [{1 gps.get_location :cond gps.is_available} :filetype]
                           :lualine_y [:location]}}
               :extensions [:nvim-tree :symbols-outline])
