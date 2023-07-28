(fn autoload [id]
  (var mod nil)
  (let [proxy {}
        ensure (fn []
                 (if mod
                     mod
                     (do
                       (set mod (require id)) mod)))]
    (setmetatable proxy
                  {:__call (fn [t ...] ((ensure) ...))
                   :__index (fn [t k] (. (ensure) k))
                   :__newindex (fn [t k v] (tset (ensure) k v))})))

{: autoload}
