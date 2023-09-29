;; [nfnl-macro]

(local pkg-table (gensym))
(fn expand-autoload [names]
  `(let [{:autoload autoload#} (require :utils)]
     ,(icollect [k v (pairs names)]
        `(set ,k (autoload# ,(tostring v))))))

(fn module! [mod]
  (if mod
      (assert-compile false "module! autoloads are not yet supported" [mod])
      `(local ,pkg-table [])))

(fn use-package! [id opts]
  (tset opts 1 id)
  `(table.insert ,pkg-table ,opts))

(fn fin! [] pkg-table)
;; (fn key [binding action ...]
;;   (let [tbl `{1 ,binding 2 ,action}]
;;     (for [idx 1 (length ...) 2]
;;       (tset tbl (. ... idx) (. ... (+ idx 1))))
;;     tbl))

{: module! : use-package! : fin!}
