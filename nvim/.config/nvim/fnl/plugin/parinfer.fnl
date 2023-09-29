(import-macros {: module! : use-package! : fin!} :macros)

(module!)
; (use-package! :eraserhd/parinfer-rust {:build "cargo build --release"})
;; Less buggy?
(use-package! :gpanders/nvim-parinfer {})
(use-package! :julienvincent/nvim-paredit {})
(use-package! :dundalek/parpar.nvim {:dependencies [:gpanders/nvim-parinfer :julienvincent/nvim-paredit]})
(fin!)
