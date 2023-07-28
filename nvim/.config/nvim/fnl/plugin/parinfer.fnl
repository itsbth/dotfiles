(import-macros {: module! : use-package! : fin!} :macros)

(module!)
(use-package! :eraserhd/parinfer-rust {:build "cargo build --release"})
(fin!)
