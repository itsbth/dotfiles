(module magic.plugin.mason
        {autoload {nvim aniseed.nvim
                   lspc lspconfig
                   : mason
                   mlspc mason-lspconfig
                   cmp cmp_nvim_lsp
                   wk which-key
                   : schemastore
                   : lsp_lines}})


; (wk.register {:K [vim.lsp.buf.hover "LSP Hover"]})

;; Misc bindings, heavily inspired by kickstart
; TODO: Only register if lsp is active

; TODO: Compare this with LSPSaga, probably too much overlap
(wk.register {:gd [vim.lsp.buf.declaration "LSP Declaration"]})
(wk.register {:gD [vim.lsp.buf.definition "LSP Definition"]})
(wk.register {:gi [vim.lsp.buf.implementation "LSP Implementation"]})
(wk.register {:<C-K> [vim.lsp.buf.signature_help "LSP Signature"]})

(wk.register {:<leader>D [vim.lsp.buf.type_definition "LSP Type Definition"]})
(wk.register {:<leader>rn [vim.lsp.buf.rename "LSP Rename"]})
(wk.register {:gr [vim.lsp.buf.references "LSP References"]})

(mason.setup {})
(mlspc.setup {:automatic_installation true})


(defn- drop-formatting [capabilities]
        (vim.tbl_deep_extend :force capabilities {}))

(def- capabilities (cmp.default_capabilities))

(lspc.tsserver.setup {: capabilities
                      :root_dir (lspc.util.root_pattern :package.json)})
(lspc.denols.setup {: capabilities
                    :root_dir (lspc.util.root_pattern :deno.json :deno.jsonc)
                    ; disable single file support to stop it from launching when it can't find deno.json
                    :single_file_support false})
(lspc.jsonls.setup {: capabilities :settings {:json {:schemas (schemastore.json.schemas)}}})

(lspc.gopls.setup {: capabilities})
(lspc.golangci_lint_ls.setup {: capabilities})

; (lspc.diagnosticls.setup {: capabilities})
; (lspc.asm_lsp.setup {: capabilities})
(lspc.clangd.setup {: capabilities})
(lspc.clojure_lsp.setup {: capabilities})
(lspc.cssls.setup {: capabilities})
(lspc.cssmodules_ls.setup {: capabilities})
(lspc.yamlls.setup {: capabilities})
; (lspc.spectral.setup {: capabilities})
(lspc.sumneko_lua.setup {: capabilities})
(lspc.taplo.setup {: capabilities})
(lspc.zk.setup {: capabilities})
(lspc.zls.setup {: capabilities})
(lspc.pylsp.setup {: capabilities})
(lspc.html.setup {: capabilities})
(lspc.grammarly.setup {: capabilities})
(lspc.emmet_ls.setup {: capabilities})
(lspc.rnix.setup {: capabilities})
(lspc.rust_analyzer.setup {: capabilities})

(defn- plugin? [name]
  (?. packer_plugins name :loaded))

(when (plugin? :lsp_lines.nvim)
      (lsp_lines.setup {})
      (vim.diagnostic.config {:virtual_text false})
      (wk.register {:<leader>tl [lsp_lines.toggle "Toggle virtual lines"]}))
