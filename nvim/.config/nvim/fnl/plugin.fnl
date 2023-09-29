(import-macros {: module! : use-package! : fin!} :macros)

(module!)

;; Fennel config
; (use-package! :udayvir-singh/tangerine.nvim {:tag "v2.6"})
(use-package! :udayvir-singh/hibiscus.nvim {:tag "v1.7"})

;; Misc core modules. Split out?
(use-package! :folke/which-key.nvim {:tag "v1.5.1"})

(fin!)
