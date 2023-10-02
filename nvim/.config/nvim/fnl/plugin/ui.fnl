(import-macros {: module! : use-package! : fin!} :macros)
(module!)
(use-package! :folke/noice.nvim
              {:event :VeryLazy
               :dependencies [:MunifTanjim/nui.nvim :rcarriga/nvim-notify]
               :opts {:lsp {:override {:vim.lsp.util.convert_input_to_markdown_lines true
                                       :vim.lsp.util.stylize_markdown true
                                       :cmp.entry.get_documentation true}}
                      :presets {:bottom_search true
                                :command_palette true
                                :long_message_to_split true
                                :inc_rename false
                                :lsp_doc_border false}}})

(use-package! :akinsho/bufferline.nvim
              {:opts {:options {:offsets [{:filetype :NvimTree
                                           :text "File Explorer"
                                           :highlight :Directory
                                           :separator true}]}}
               :dependencies [:nvim-tree/nvim-web-devicons]})

(fin!)