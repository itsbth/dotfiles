(module magic.plugin.telescope
  {autoload {nvim aniseed.nvim
             wk which-key}})

(defn- telescope [action]
  (.. "<cmd>Telescope "  action  "<cr>"))

(wk.register {:f {:name "file"
                  :f [(telescope :find_files) "Find File"]
                  :g [(telescope :live_grep) "Live Grep"]
                  :b [(telescope :buffers) "Buffers"]}}
             {:prefix :<leader>})
