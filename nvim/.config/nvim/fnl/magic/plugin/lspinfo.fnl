(module magic.plugin.lspinfo
        {autoload {nvim aniseed.nvim
                   lspi nvim-lsp-installer
                   cmp cmp_nvim_lsp
                   wk which-key
                   : schemastore}})

(defn- drop-formatting [caps]
       (set caps.document_formatting false)
       (set caps.range_formatting false)
       caps)

(defn- get-server-opts [name]
       (let [capabilities (-> (vim.lsp.protocol.make_client_capabilities)
                              (cmp.update_capabilities))]
         (match name
           ;; TODO: Intelligently choose between deno and ts (how?)
           :denols
           {:autostart false : capabilities}
           :tsserver
           {:autostart true :capabilities (drop-formatting capabilities)}
           :jsonls
           {:settings {:json {:schemas (schemastore.json.schemas)}}
            :capabilities (drop-formatting capabilities)}
           _ {: capabilities})))

(lspi.on_server_ready (fn [server]
                        (server:setup (get-server-opts server.name))
                        (nvim.ex.do "User LspAttachBuffers")))

(wk.register {:K [vim.lsp.buf.hover "LSP Hover"]})
