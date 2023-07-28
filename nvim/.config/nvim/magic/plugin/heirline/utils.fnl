(module magic.plugin.heirline.utils)

(defn- table? [v] (= (type v) :table))

(defn section [opts els] (each [k v (ipairs els)]
                           (tset opts k v))
      (match opts.init
        init (set opts.init
                  (fn [self]
                    (match (init self)
                      val (when (table? val)
                            (each [k v (pairs val)]
                              (tset self k v))))))) opts)
