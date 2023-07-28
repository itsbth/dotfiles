(module magic.plugin.windline 
  {autoload {nvim aniseed.nvim
             : windline
             helper windline.helpers
             utils windline.utils
             animation wlanimation
             efffects wlanimation.effects}})

(local sep helper.separators)

(local state _G.WindLine.state)
(local hl-list {:Black {1 :white 2 :black}
                :Inactive {1 :InactiveFg 2 :InactiveBg}
                :Active {1 :ActiveFg 2 :ActiveBg}})

(local basic {})
(set basic.divider {1 "%=" 2 ""})
(set basic.space {1 " " 2 ""})
(set basic.line_col {1 " %3l:%-2c " 2 hl-list.Black})
(set basic.progress {1 "%3p%% " 2 hl-list.Black})
(set basic.bg {1 " " 2 :StatusLine})
(set basic.file_name_inactive {1 "%f" 2 hl-list.Inactive})
(set basic.line_col_inactive {1 " %3l:%-2c " 2 hl-list.Inactive})
(set basic.progress_inactive {1 "%3p%% " 2 hl-list.Inactive})
(utils.change_mode_name {:n {1 " NORMAL" 2 :Normal}
                         :no {1 " O-PENDING" 2 :Visual}
                         :nov {1 " O-PENDING" 2 :Visual}
                         :noV {1 " O-PENDING" 2 :Visual}
                         "no\022" {1 " O-PENDING" 2 :Visual}
                         :niI {1 " NORMAL" 2 :Normal}
                         :niR {1 " NORMAL" 2 :Normal}
                         :niV {1 " NORMAL" 2 :Normal}
                         :v {1 "󰂔 VISUAL" 2 :Visual}
                         :V {1 "󰂔 V-LINE" 2 :Visual}
                         "\022" {1 "󰂔 V-BLOCK" 2 :Visual}
                         :s {1 " SELECT" 2 :Visual}
                         :S {1 " S-LINE" 2 :Visual}
                         "\019" {1 " S-BLOCK" 2 :Visual}
                         :i {1 " INSERT" 2 :Insert}
                         :ic {1 " INSERT" 2 :Insert}
                         :ix {1 " INSERT" 2 :Insert}
                         :R {1 "󰈺 REPLACE" 2 :Replace}
                         :Rc {1 "󰈺 REPLACE" 2 :Replace}
                         :Rv {1 :V-REPLACE 2 :Normal}
                         :Rx {1 "󰈺 REPLACE" 2 :Normal}
                         :c {1 " COMMAND" 2 :Command}
                         :cv {1 " COMMAND" 2 :Command}
                         :ce {1 " COMMAND" 2 :Command}
                         :r {1 "󰈺 REPLACE" 2 :Replace}
                         :rm {1 " MORE" 2 :Normal}
                         :r? {1 " CONFIRM" 2 :Normal}
                         :! {1 " SHELL" 2 :Normal}
                         :t {1 " TERMINAL" 2 :Command}})

(set basic.vi_mode {:name :vi_mode
                    :hl_colors {:Normal {1 :white 2 :black}
                                :Insert {1 :black 2 :red}
                                :Visual {1 :black 2 :green}
                                :Replace {1 :black 2 :cyan}
                                :Command {1 :black 2 :yellow}}
                    :text (fn []
                            (.. " " (. state.mode 1) " "))
                    :hl (fn []
                          (. state.mode 2))})

(set basic.vi_mode_sep {:name :vi_mode_sep
                        :hl_colors {:Normal {1 :black 2 :FilenameBg}
                                    :Insert {1 :red 2 :FilenameBg}
                                    :Visual {1 :green 2 :FilenameBg}
                                    :Replace {1 :cyan 2 :FilenameBg}
                                    :Command {1 :yellow 2 :FilenameBg}}
                        :text (fn []
                                sep.right_rounded)
                        :hl (fn []
                              (. state.mode 2))})

(set basic.file_name
     {:text (fn []
              (var name (vim.fn.expand "%:p:t"))
              (when (= name "")
                (set name "[No Name]"))
              (.. name " "))
      :hl_colors {1 :FilenameFg 2 :FilenameBg}})

(local wave-left
       {:text (fn []
                {1 {1 (.. sep.right_rounded " ")
                    2 {1 :black_light 2 :waveleft1}}
                 2 {1 (.. sep.right_rounded " ") 2 {1 :waveleft1 2 :waveleft2}}
                 3 {1 (.. sep.right_rounded " ") 2 {1 :waveleft2 2 :waveleft3}}
                 4 {1 (.. sep.right_rounded " ") 2 {1 :waveleft3 2 :waveleft4}}
                 5 {1 (.. sep.right_rounded " ") 2 {1 :waveleft4 2 :waveleft5}}
                 6 {1 (.. sep.right_rounded " ")
                    2 {1 :waveleft5 2 :wavedefault}}})})

(local wave-right {:text (fn []
                           {1 {1 (.. " " sep.left_rounded)
                               2 {1 :waveright1 2 :wavedefault}}
                            2 {1 (.. " " sep.left_rounded)
                               2 {1 :waveright2 2 :waveright1}}
                            3 {1 (.. " " sep.left_rounded)
                               2 {1 :waveright3 2 :waveright2}}
                            4 {1 (.. " " sep.left_rounded)
                               2 {1 :waveright4 2 :waveright3}}
                            5 {1 (.. " " sep.left_rounded)
                               2 {1 :waveright5 2 :waveright4}}
                            6 {1 (.. " " sep.left_rounded)
                               2 {1 :black 2 :waveright5}}})})

(local default {:filetypes {1 :default}
                :active {1 basic.vi_mode
                         2 basic.vi_mode_sep
                         3 {1 " " 2 ""}
                         4 basic.file_name
                         5 wave-left
                         6 {1 " " 2 {1 :FilenameBg 2 :wavedefault}}
                         7 basic.divider
                         8 wave-right
                         9 basic.line_col
                         10 basic.progress}
                :inactive {1 basic.file_name_inactive
                           2 basic.divider
                           3 basic.divider
                           4 basic.line_col_inactive
                           5 {1 "" 2 {1 :white 2 :InactiveBg}}
                           6 basic.progress_inactive}})

(windline.setup {:colors_name (fn [colors]
                                (set colors.FilenameFg colors.white_light)
                                (set colors.FilenameBg colors.black_light)
                                (set colors.wavedefault colors.white_light)
                                (set colors.waveleft1 colors.wavedefault)
                                (set colors.waveleft2 colors.wavedefault)
                                (set colors.waveleft3 colors.wavedefault)
                                (set colors.waveleft4 colors.wavedefault)
                                (set colors.waveleft5 colors.wavedefault)
                                (set colors.waveright1 colors.wavedefault)
                                (set colors.waveright2 colors.wavedefault)
                                (set colors.waveright3 colors.wavedefault)
                                (set colors.waveright4 colors.wavedefault)
                                (set colors.waveright5 colors.wavedefault)
                                colors)
                 :statuslines {1 default}})

(local blue-colors {1 "#90CAF9"
                    2 "#64B5F6"
                    3 "#42A5F5"
                    4 "#2196F3"
                    5 "#1E88E5"
                    6 "#1976D2"
                    7 "#1565C0"
                    8 "#0D47A1"})

(animation.animation {:data {1 {1 :waveleft1
                                2 (efffects.list_color blue-colors 6)}
                             2 {1 :waveleft2
                                2 (efffects.list_color blue-colors 5)}
                             3 {1 :waveleft3
                                2 (efffects.list_color blue-colors 4)}
                             4 {1 :waveleft4
                                2 (efffects.list_color blue-colors 3)}
                             5 {1 :waveleft5
                                2 (efffects.list_color blue-colors 2)}}
                      :timeout 100
                      :delay 200
                      :interval 150})

(animation.animation {:data {1 {1 :waveright1
                                2 (efffects.list_color blue-colors 2)}
                             2 {1 :waveright2
                                2 (efffects.list_color blue-colors 3)}
                             3 {1 :waveright3
                                2 (efffects.list_color blue-colors 4)}
                             4 {1 :waveright4
                                2 (efffects.list_color blue-colors 5)}
                             5 {1 :waveright5
                                2 (efffects.list_color blue-colors 6)}}
                      :timeout 100
                      :delay 200
                      :interval 150})

