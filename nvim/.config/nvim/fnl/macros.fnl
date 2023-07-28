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

{: module!
 : use-package!
 : fin!}
