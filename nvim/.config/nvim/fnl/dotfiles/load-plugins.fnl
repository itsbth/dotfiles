(module dotfiles.load-plugins
  {require {nvim aniseed.nvim
            util dotfiles.util}})

(defn load []
  (let [files (util.glob (.. (nvim.fn.stdpath :config) "/lua/dotfiles/plugins/*.lua"))]
    (each [_ file (ipairs files)]
      (let [plugin (nvim.fn.fnamemodify file ":t:r")]
        ; handle both plugin and plugin.vim
        (when (or (. nvim.g.plugs plugin) (. nvim.g.plugs (.. plugin ".vim")))
          (pcall require (.. "dotfiles.plugins." plugin)))))))
