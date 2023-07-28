(module magic.plugin.telescope
        {autoload {nvim aniseed.nvim
                   wk which-key
                   : telescope
                   bi telescope.builtin}})

; (telescope.setup {:extensions {:fzf {:fuzzy true
;                                      :override_generic_sorter true
;                                      :override_file_sorter true
;                                      :case_mode :smart_case}}})
;
; (telescope.load_extension :fzf)

(wk.register {:f {:name :file
                  :f [bi.find_files "Find File"]
                  :g [bi.live_grep "Live Grep"]
                  :b [bi.buffers :Buffers]
                  :r [bi.resume :Resume]}} {:prefix :<leader>})

