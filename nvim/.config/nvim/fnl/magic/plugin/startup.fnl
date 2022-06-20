(module magic.plugin.startup
  {autoload {nvim aniseed.nvim
             : startup}})

; Will error when session is restored.
; TODO: Figure out how to enable it again if there's no session to restore.
(set nvim.g.startup_disable_on_startup true)

(startup.setup)
