(module magic.plugin.lspinfo
        {autoload {nvim aniseed.nvim
                   lspi nvim-lsp-installer
                   cmp cmp_nvim_lsp}})

(defn- get-server-opts [name]
        (let [capabilities (-> (vim.lsp.protocol.make_client_capabilities) (cmp.update_capabilities))]
             (match name
                    ;; TODO: Intelligently choose between deno and ts (how?)
                    :denols {:autostart false : capabilities}
                    :tsserver {:autostart true : capabilities}
                    _ {: capabilities})))

(lspi.on_server_ready
        (fn [server]
            (server:setup (get-server-opts server.name))
            (nvim.ex.do "User LspAttachBuffers")))

