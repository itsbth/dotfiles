(module init
  {require {nvim aniseed.nvim
            load-plugins dotfiles.load-plugins
            treesitter nvim-treesitter.configs}})

(load-plugins.load)

(def- opts
  {:title true
   :shiftwidth 2 ; better default than 8, at least
   :expandtab true})

(each [k v (pairs opts)]
  (tset nvim.o k v))
