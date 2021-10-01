(module magic.plugin.lspinfo
  {autoload {nvim aniseed.nvim
             lspi nvim-lsp-installer}})

(lspi.on_server_ready (fn [server]
                        (server:setup {})
                        nvim.cmd "do User LspAttachBuffers"))
