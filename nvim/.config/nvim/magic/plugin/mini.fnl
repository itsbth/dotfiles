(module magic.plugin.mini
        {autoload
         {nvim aniseed.nvim
          com mini.comment
          surr mini.surround
          pair mini.pairs}})

; disable mini.sessions
(set vim.g.minisessions_disable true)

(com.setup)
; use vim-surround-like bindings for now
(surr.setup {:mappings {:add :ys
                        :delete :ds
                        :find ""
                        :find_left ""
                        :highlight ""
                        :replace :cs
                        :update_n_lines ""}})

(vim.keymap.set :x :S #(surr.add :visual) {:noremap true})
(vim.keymap.set :n :yss :ys_ {:noremap true})


(pair.setup {})
