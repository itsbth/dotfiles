(module dotfiles.plugins.nvim-lspconfig
  {require {lsp lspconfig 
            lspi lspinstall
            completion completion}})

; Providers without any specific configuration
(def- simple-providers
  [:gopls
   :jsonls
   :rust_analyzer
   :solargraph
   :sumneko_lua
   :terraformls
   :tsserver
   :vimls
   :yamlls
   :zls])

(def- providers {:pyls_ms {:cmd
                           [:dotnet :exec "/home/itsbth/repos/github.com/Microsoft/python-language-server/output/bin/Debug/Microsoft.Python.LanguageServer.dll"]}})


(defn- setup []
  (each [_ provider (ipairs (lspi.installed_servers))]
    (test providers provider {}))
  (each [_ provider (ipairs simple-providers)]
    (tset providers provider {}))

  (each [provider opts (ipairs providers)]
    ((. lsp provider :setup) {:on_attach completion.on_attach})))

(lspi.setup)
(setup)
(tset lspi :post-install-hook (fn [] (setup) (vim.cmd "bufdo e")))
