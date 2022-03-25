(module magic.plugin.nvim-tree
  {autoload {nvim aniseed.nvim
             tree nvim-tree
             wk which-key}})

(tree.setup {:auto_close true})

(wk.register {:f {:name "Tree"
                  :t ["<cmd>NvimTreeToggle<cr>" "Toggle Tree"]}}
             {:prefix :<leader>})
