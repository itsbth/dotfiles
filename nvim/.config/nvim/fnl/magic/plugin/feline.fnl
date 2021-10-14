(module magic.plugin.feline
  {autoload {: feline
             vmu :feline.providers.vi_mode
             lst lsp-status}})

;; XXX: Feline.generator creates a local reference to feline.components at
;; load, so make sure we re-use the table
(def- components (or feline.components {}))
(set components.active [[] [] []])
(set components.inactive [[] [] []])

(defn- position->index [pos]
  (match pos
    :left 1
    :middle 2
    :right 3))

(defn- add-component [pos component]
  (table.insert (. components.active (position->index pos)) component))


; lualine pale night from https://github.com/hoob3rt/lualine.nvim/blob/master/lua/lualine/themes/palenight.lua
(def- colors
  {:black "#292d3e"
   :blue "#82b1ff"
   :comment_grey "#697098"
   :cursor_grey "#2c323c"
   :cyan "#89ddff"
   :dark_red "#be5046"
   :dark_yellow "#f78c6c"
   :green "#c3e88d"
   :gutter_fg_grey "#4b5263"
   :light_red "#ff869a"
   :menu_grey "#3e4452"
   :purple "#c792ea"
   :red "#ff5370"
   :special_grey "#3b4048"
   :vertsplit "#181a1f"
   :white "#bfc7d5"
   :yellow "#ffcb6b"})

(defn- color-by-mode []
  {:name (vmu.get_mode_highlight_name)
   :fg :black
   :bg (vmu.get_mode_color)
   :style :bold})

(add-component :left {:provider :vi_mode
                      :hl color-by-mode
                      :left_sep {:str " " :hl color-by-mode}
                      :right_sep {:str " " :hl color-by-mode}})
(add-component :left {:provider :file_info
                      :hl color-by-mode
                      :right_sep :right_filled})
(add-component :left {:provider :git_branch
                      :left_sep " "})
(add-component :left {:provider :git_diff_added})
(add-component :left {:provider :git_diff_changed})
(add-component :left {:provider :git_diff_removed})
(add-component :left {:left_sep :right :provider ""})

(add-component :middle {:provider :lsp_client_names})
(add-component :middle {:provider (fn [] (lst.status))})
(add-component :middle {:provider :diagnostic_errors})
(add-component :middle {:provider :diagnostic_warnings})
(add-component :middle {:provider :diagnostic_hints})

(add-component :right {:provider :file_type})
(add-component :right {:provider :file_encoding})

(feline.setup {: components : colors})
(feline.reset_highlights)
