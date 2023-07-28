(module magic.plugin.bufferline
  {autoload {: bufferline}})

(set vim.o.showtabline 2)

(bufferline.setup
  {:options {:diagnostics :nvim_lsp
             ; bufferline interacts with showtabline in unexpected ways. allow it to manage it itself.
             ; :always_show_bufferline false
             :offsets [{:filetype :NvimTree
                        :text "File Explorer"
                        :highlight :Directory
                        :text_align :left}]}})
