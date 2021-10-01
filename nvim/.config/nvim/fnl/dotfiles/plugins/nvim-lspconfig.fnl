(module dotfiles.plugins.nvim-lspconfig
  {require {lsp lspconfig 
            lspi lspinstall}})
            ; completion completion}})

; Providers without any specific configuration
(def- simple-providers
  [:gopls
   ; :jsonls
   :rust_analyzer
   :solargraph
   ; :sumneko_lua
   :terraformls
   ; :tsserver
   ; :vimls
   ; :yamlls
   :denols
   :pylsp
   :zls])

(def- providers {})

(defn- setup []
  (each [_ provider (ipairs (lspi.installed_servers))]
    (tset providers provider {}))
  (each [_ provider (ipairs simple-providers)]
    (tset providers provider {}))

  ; (print (vim.inspect providers))

  (each [provider opts (pairs providers)]
    (local (succ res) (pcall (. lsp provider :setup) opts))
    (when (not succ)
      (print res))))

(lspi.setup)
(setup)
(tset lspi :post-install-hook (fn [] (setup) (vim.cmd "bufdo e")))
