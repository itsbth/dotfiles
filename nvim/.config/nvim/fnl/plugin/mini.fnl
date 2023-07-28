(import-macros {: module! : use-package! : fin!} :macros)
;; (local {: autoload} (require :utils))
(module!)

;; (local surr (autoload :mini.surround))
;; (local mpair (autoload :mini.pairs))
;; (local comm (autoload :mini.comment))

(fn config []
    (let [surr (require :mini.surround)
          mpair (require :mini.pairs)
          comm (require :mini.comment)]
        (surr.setup {})
        (mpair.setup {})
        (comm.setup {})))

(use-package! :echasnovski/mini.nvim {: config})

(fin!)
