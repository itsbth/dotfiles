(module magic.plugin.heirline.lsp
        {autoload {utils heirline.utils conditions heirline.conditions}})

(defn- re-number [tbl] (let [out []]
                         (each [_ v (pairs tbl)]
                           (table.insert out v))
                         out))

(def lsp-active {:condition conditions.lsp_attached
                 ; :update [:LspAttach :LspDetach]
                 :provider (fn []
                             (.. " ["
                                 (table.concat (re-number (collect [k v (pairs (vim.lsp.buf_get_clients 0))]
                                                            (values k v.name)))
                                               " ")
                                 "]"))
                 :hl {:fg :green :bold true}})
