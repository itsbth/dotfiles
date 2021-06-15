(module dotfiles.gblame
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util
            view aniseed.view}})

(fn run-and-get-output [cmd args cb]
  (local stdout (vim.loop.new_pipe false))
  (local stderr (vim.loop.new_pipe false))
  (var handle nil)
  (local buff [])
  (set handle
       (vim.loop.spawn cmd
                       {:args args
                        :stdio [stdout stderr]}
                       (fn [ec]
                         (stdout:read_stop)
                         (stderr:read_stop)
                         (stdout:close)
                         (stderr:close)
                         (handle:close)
                         (cb ec buff))))
  (vim.loop.read_start stdout (fn [err data] (table.insert buff data)))
  (vim.loop.read_start stderr (fn [err data] (table.insert buff data)))
  handle)

(fn format-blame [line]
  (-> line
      (string.gsub "%).*" "")
      (string.gsub "%(" "")))

(defonce- *ns* (nvim.create_namespace "fnl-gblame")) 

(defonce- *cache* {})

(defn get-blame [fname cb]
  (if (. *cache* fname)
    (cb 0 (. *cache* fname))
    (run-and-get-output "git" ["blame" fname]
                        (fn [ec buff]
                          (when (= ec 0)
                            (tset *cache* fname buff))
                          (cb ec buff)))))

(defn update []
  (get-blame (vim.fn.expand "%:p")
             (vim.schedule_wrap
               (fn [ec buff]
                 (when (= ec 0)
                   (local lines (vim.fn.split (table.concat buff) "\n"))
                   (local line (. (nvim.win_get_cursor 0) 1))
                   (nvim.buf_clear_namespace 0 *ns* 0 -1)
                   (nvim.buf_set_virtual_text 0 *ns* (- line 1) [[(format-blame (. lines line)) :Comment]] {})
                   nil))))
  nil)

(defn invalidate []
  (local key (vim.fn.expand "%:p"))
  (tset *cache* key nil))

(nu.fn-bridge "FnlGBlameUpdate" :dotfiles.gblame :update {:return false})
(nu.fn-bridge "FnlGBlameInvalidate" :dotfiles.gblame :update {:return false})

(vim.api.nvim_command "augroup gblame")
(vim.api.nvim_command "autocmd!")
(vim.api.nvim_command "autocmd CursorMoved * call FnlGBlameUpdate()")
(vim.api.nvim_command "autocmd TextChanged * call FnlGBlameInvalidate()")

(vim.api.nvim_command "augroup END")
