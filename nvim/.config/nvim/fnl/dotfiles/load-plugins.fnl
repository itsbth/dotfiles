(module dotfiles.load-plugins
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util
            util dotfiles.util}})

(def- loaded [])

; todo: move to utils
(defn- some [list pred? idx]
  (local i (or idx 1))
  (match (. list i)
    (where nil) false
    (where a (pred? a)) true
    (where _) (some list pred? (+ i 1))))

(defn is-loaded [pname]
  (local variants [pname (.. pname ".vim") (.. pname ".nvim") (.. "vim-" pname)])
  (some variants (fn [el] (. nvim.g.plugs el))))

(defn load []
  (let [files (util.glob (.. (nvim.fn.stdpath :config) "/lua/dotfiles/plugins/*.lua"))]
    (each [_ file (ipairs files)]
      (let [plugin (nvim.fn.fnamemodify file ":t:r")]
        ; handle both plugin and plugin.vim
        (when (is-loaded plugin)
          (table.insert loaded plugin)
          (pcall require (.. "dotfiles.plugins." plugin)))))))

; debugging tool, to verify that a plugin has been loaded
(nu.fn-bridge
  :PrintLoadedPlugins
  :dotfiles.load-plugins :print-loaded-plugins)

(defn print-loaded-plugins []
  (each [_ plugin (ipairs loaded)]
    (print plugin)))

