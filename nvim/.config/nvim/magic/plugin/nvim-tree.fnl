(module magic.plugin.nvim-tree
        {autoload {nvim aniseed.nvim tree nvim-tree wk which-key}
         require-macros [magic.macros]})

(tree.setup {})

(wk.register {:f {:name :Tree :t [:<cmd>NvimTreeToggle<cr> "Toggle Tree"]}}
             {:prefix :<leader>})

; trigger stuff
(augroup! close-nvim-tree :BufEnter
          {:callback #(when (and (= (length (nvim.list_wins)) 1)
                                 (: (nvim.buf_get_name 0) :match :NvimTree_))
                        (nvim.command :quit))})
