(module dotfiles.load-plugins
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util
            util dotfiles.util}})

(def- loaded [])

(defn load []
  (let [files (util.glob (.. (nvim.fn.stdpath :config) "/lua/dotfiles/plugins/*.lua"))]
    (each [_ file (ipairs files)]
      (let [plugin (nvim.fn.fnamemodify file ":t:r")]
        ; handle both plugin and plugin.vim
        (when (or (. nvim.g.plugs plugin) (. nvim.g.plugs (.. plugin ".vim")))
          (table.insert loaded plugin)
          (pcall require (.. "dotfiles.plugins." plugin)))))))

; debugging tool, to verify that a plugin has been loaded
(nu.fn-bridge
  :PrintLoadedPlugins
  :dotfiles.load-plugins :print-loaded-plugins)

(defn print-loaded-plugins []
  (each [_ plugin (ipairs loaded)]
    (print plugin)))

