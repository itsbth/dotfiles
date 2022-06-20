(module magic.plugin.lspinfo
        {autoload {nvim aniseed.nvim
                   lspc lspconfig
                   lspi nvim-lsp-installer
                   cmp cmp_nvim_lsp
                   wk which-key
                   : schemastore}})


(wk.register {:K [vim.lsp.buf.hover "LSP Hover"]})

;; Misc bindings, heavily inspired by kickstart
; TODO: Only register if lsp is active

(wk.register {:gd [vim.lsp.buf.declaration "LSP Declaration"]})
(wk.register {:gD [vim.lsp.buf.definition "LSP Definition"]})
(wk.register {:gi [vim.lsp.buf.implementation "LSP Implementation"]})
(wk.register {:<C-K> [vim.lsp.buf.signature_help "LSP Signature"]})

(wk.register {:<leader>D [vim.lsp.buf.type_definition "LSP Type Definition"]})
(wk.register {:<leader>rn [vim.lsp.buf.rename "LSP Rename"]})
(wk.register {:gr [vim.lsp.buf.references "LSP References"]})

(lspi.setup {:automatic_installation true})

(defn- drop-formatting [capabilities]
        (vim.tbl_deep_extend :force capabilities {}))

(def- capabilities (-> (vim.lsp.protocol.make_client_capabilities)
                       (cmp.update_capabilities)))

(lspc.tsserver.setup {: capabilities
                      :root_dir (lspc.util.root_pattern :package.json)})
(lspc.denols.setup {: capabilities
                    :root_dir (lspc.util.root_pattern :deno.json :deno.jsonc)})
(lspc.jsonls.setup {: capabilities :settings {:json {:schemas (schemastore.json.schemas)}}})

(lspc.golangci_lint_ls.setup {: capabilities})
(lspc.diagnosticls.setup {: capabilities})
(lspc.asm_lsp.setup {: capabilities})
(lspc.clangd.setup {: capabilities})
(lspc.clojure_lsp.setup {: capabilities})
(lspc.cssls.setup {: capabilities})
(lspc.cssmodules_ls.setup {: capabilities})
; (lspc.spectral.setup {: capabilities})
(lspc.sumneko_lua.setup {: capabilities})
(lspc.taplo.setup {: capabilities})
(lspc.zk.setup {: capabilities})
(lspc.zls.setup {: capabilities})
(lspc.pylsp.setup {: capabilities})
(lspc.html.setup {: capabilities})
(lspc.grammarly.setup {: capabilities})
(lspc.emmet_ls.setup {: capabilities})
