(module magic.plugin.heirline.git
        {autoload {conditions heirline.conditions
                   {: section} magic.plugin.heirline.utils}})

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

(def git-status (section {:condition conditions.is_git_repo
                          :init (fn [self]
                                  (let [status_dict vim.b.gitsigns_status_dict
                                        has_changes (or (not= status_dict.added
                                                              0)
                                                        (not= status_dict.removed
                                                              0)
                                                        (not= status_dict.changed
                                                              0))]
                                    {: status_dict : has_changes}))}
                         ; :hl {:fg :orange}}
                         [{:provider (fn [{: status_dict}]
                                       (.. " " status_dict.head))}
                          (section {:condition (fn [{: has_changes}]
                                                 has_changes)}
                                   [{:provider "("}
                                    {:provider (fn [{: status_dict}]
                                                 (let [added (or status_dict.added 0)]
                                                   (when (> added 0)
                                                     (.. "+" added))))
                                     :hl {:fg :git_add}}
                                    {:provider (fn [{: status_dict}]
                                                 (let [removed (or status_dict.removed 0)]
                                                   (when (> removed 0)
                                                     (.. "-" removed))))
                                     :hl {:fg :git_del}}
                                    {:provider (fn [{: status_dict}]
                                                 (let [changed (or status_dict.changed 0)]
                                                   (when (> changed 0)
                                                     (.. "~" changed))))
                                     :hl {:fg :git_change}}
                                    {:provider ")"}])]))
