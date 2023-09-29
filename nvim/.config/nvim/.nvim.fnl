(let [autogroup (vim.api.nvim_create_augroup :local_insert_boilerplate
                                             {:clear true})]
  (vim.api.nvim_create_autocmd :BufNewFile
                               {:group autogroup
                                :pattern [:*.fnl]
                                :callback (fn []
                                            (vim.api.nvim_buf_set_lines 0 0 0
                                                                        false
                                                                        ["(import-macros {: module! : use-package! : fin!} :macros)"
                                                                         "(module!)"
                                                                         "(fin!)"]))}))
(let [lspc (require :lspconfig)]
  (lspc.fennel_ls.setup {:init_options {}}))

