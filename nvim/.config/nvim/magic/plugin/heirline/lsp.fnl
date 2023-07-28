(module magic.plugin.heirline.lsp
        {autoload {utils heirline.utils conditions heirline.conditions}})

(def lsp-active
  {:condition conditions.lsp_attached
   ; :update [:LspAttach :LspDetach]
   :provider (fn []
               (.. " [" (table.concat (icollect [_ v (pairs (vim.lsp.buf_get_clients 0))]
                                           v.name)
                                         " ")
                "]"))
   :hl {:fg :green :bold true}})
