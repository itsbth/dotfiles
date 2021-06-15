(module dotfiles.plugins.nvim-compe
  {require {compe compe
            nvim aniseed.nvim}})

(compe.setup {:enabled true
              :autocomplete true
              :debug false
              :min_length 1
              :preselect :enable
              :throttle_time 80
              :source_timeout 200
              :incomplete_delay 400
              :max_abbr_width 100
              :max_kind_width 100
              :max_menu_width 100
              :documentiation :true
              :source {:path true
                       :nvim_lsp true}})

(defn- t [str]
  (nvim.replace_termcodes str true true true))

(defn- check-back-space []
  (local col (- (vim.fn.col :.) 1))
  (or (= col 0) (: (: (vim.fn.getline :.) :sub col col) :match :%s)))

(defn tab-complete []
  (print (.. "t-c " (vim.fn.pumvisible)))
  (if (= (vim.fn.pumvisible) 1)
    (t "<C-n>")
    (if (check-back-space)
      (t "<Tab>")
      ((. vim.fn "compe#complete")))))

(defn s-tab-complete []
  (if (= (vim.fn.pumvisible) 1)
    (t "<C-p>")
    (t "<S-Tab>")))

(tset _G :co_tab_complete tab-complete)
(tset _G :co_s_tab_complete s-tab-complete)

(nvim.set_keymap :i "<Tab>" "v:lua.co_tab_complete()" {:expr true})
(nvim.set_keymap :s "<Tab>" "v:lua.co_tab_complete()" {:expr true})
(nvim.set_keymap :i "<S-Tab>" "v:lua.co_s_tab_complete()" {:expr true})
(nvim.set_keymap :s "<S-Tab>" "v:lua.co_s_tab_complete()" {:expr true})

