(module magic.plugin.heirline.vi-mode
            {require-macros [magic.macros]})

(def vi-mode
     {:init (fn [self]
              (augroup! heirline-vi-mode
                        :ModeChanged {:pattern :*:*o :callback #(vim.cmd :redrawstatus)})
              (set self.mode (vim.fn.mode 1)))
      :static {:mode_names {:n :N
                            :no :N?
                            :nov :N?
                            :noV :N?
                            "no\022" :N?
                            :niI :Ni
                            :niR :Nr
                            :niV :Nv
                            :nt :Nt
                            :v :V
                            :vs :Vs
                            :V :V_
                            :Vs :Vs
                            "\022" :^V
                            "\022s" :^V
                            :s :S
                            :S :S_
                            "\019" :^S
                            :i :I
                            :ic :Ic
                            :ix :Ix
                            :R :R
                            :Rc :Rc
                            :Rx :Rx
                            :Rv :Rv
                            :Rvc :Rv
                            :Rvx :Rv
                            :c :C
                            :cv :Ex
                            :r "..."
                            :rm :M
                            :r? "?"
                            :! "!"
                            :t :T}
               :mode_colors {:n :red
                             :i :green
                             :v :cyan
                             :V :cyan
                             "\022" :cyan
                             :c :orange
                             :s :purple
                             :S :purple
                             "\019" :purple
                             :R :orange
                             :r :orange
                             :! :red
                             :t :red}}
      :provider (fn [self]
                  (.. "%2(" (. self.mode_names self.mode) "%)"))
      :hl (fn [self]
            {:fg (. self.mode_colors (self.mode:sub 1 1)) :bold true})
      :update [:ModeChanged]})
