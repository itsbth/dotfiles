(module magic.plugin.heirline
  {autoload {nvim aniseed.nvim
             : heirline
             utils heirline.utils
             gps nvim-gps
             devicons nvim-web-devicons
             {: vi-mode} magic.plugin.heirline.vi-mode
             {: lsp-active} magic.plugin.heirline.lsp
             {: git-status} magic.plugin.heirline.git}})

(gps.setup {})

; default to error to easily spot missing hl
(defn- fg [hl] (or hl.fg 0xff00ff))

(defn- bg [hl] (or hl.bg 0xff00ff))

(fn setup-colors []
  {:bright_bg (bg (utils.get_highlight :Folded))
   :bright_fg (fg (utils.get_highlight :Folded))
   :red (fg (utils.get_highlight :DiagnosticError))
   :dark_red (bg (utils.get_highlight :DiffDelete))
   :green (fg (utils.get_highlight :String))
   :blue (fg (utils.get_highlight :Function))
   :gray (fg (utils.get_highlight :NonText))
   :orange (fg (utils.get_highlight :Constant))
   :purple (fg (utils.get_highlight :Statement))
   :cyan (fg (utils.get_highlight :Special))
   :diag_warn (fg (utils.get_highlight :DiagnosticWarn))
   :diag_error (fg (utils.get_highlight :DiagnosticError))
   :diag_hint (fg (utils.get_highlight :DiagnosticHint))
   :diag_info (fg (utils.get_highlight :DiagnosticInfo))
   :git_del (fg (utils.get_highlight :DiffDelete))
   :git_add (fg (utils.get_highlight :DiffAdd))
   :git_change (fg (utils.get_highlight :DiffChange))})

; (utils.get_highlight :diffremoved)

(heirline.load_colors (setup-colors))
(vim.api.nvim_create_augroup :Heirline {:clear true})
(vim.api.nvim_create_autocmd :ColorScheme
                             {:callback (fn []
                                          (local colors (setup-colors))
                                          (utils.on_colorscheme colors))
                              :group :Heirline})

(def- file-name-parent
  {:init (fn [self]
           (set self.filename (vim.api.nvim_buf_get_name 0)))})

(def- file-icon {:init (fn [self]
                         (let [ext (vim.fn.fnamemodify self.filename ":e")
                               (icon col) (devicons.get_icon_color self.filename
                                                                   ext)]
                           (set self.icon icon)
                           (set self.icon_color col)))
                 :provider (fn [self]
                             (when self.icon
                               (.. self.icon " ")))
                 :hl (fn [self]
                       {:fg self.icon_color})})

(def file-modifiers [{:condition (fn [] vim.bo.modified)
                      :provider "[+]"}
                     {:condition #(or (not vim.bo.modifiable) vim.bo.readonly)
                      :provider ""
                      :hl {:fg :orange}}])

(def- file-name-block
  {:provider (fn [self]
               (let [relative (vim.fn.fnamemodify self.filename ":.")]
                 (if (not= relative "")
                   relative
                   "[No name]")))
   :hl {:fg (fg (utils.get_highlight :Directory))}})

(def- file-name-block (utils.insert file-name-parent file-icon (utils.insert file-name-block file-modifiers)))

(heirline.setup {:statusline [(utils.surround ["" ""] :bright_bg [vi-mode])
                              {:provider " "}
                              file-name-block
                              {:provider " "}
                              git-status
                              {:provider "%="}
                              lsp-active]})

