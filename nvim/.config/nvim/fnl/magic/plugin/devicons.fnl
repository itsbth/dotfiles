(module magic.plugin.devicons
  {autoload {nvim aniseed.nvim
             devicons nvim-web-devicons}})

(devicons.setup {:override {:fnl {:icon ""
                                  ;; color stolen from clojure
                                  :color "#8dc149"
                                  :name "Fennel"}}})

