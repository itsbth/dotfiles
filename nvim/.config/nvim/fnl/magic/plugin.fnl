(module magic.plugin {autoload {a aniseed.core lazy}})

(defn- safe-require-plugin-config [name]
       "Safely require a module under the magic.plugin.* prefix. Will catch errors
  and print them while continuing execution, allowing other plugins to load
  even if one configuration module is broken."
       (let [(ok? val-or-err) (pcall require (.. :magic.plugin. name))]
         (when (not ok?)
           (print (.. "Plugin config error: " val-or-err)))))

(defn req [name] "A shortcut to building a require string for your plugin
  configuration. Intended for use with packer's config or setup
  configuration options. Will prefix the name with `magic.plugin.`
  before requiring." (.. "require('magic.plugin." name "')"))

(defn fold-pairs [pairs]
  "Convert a table of interleaved keys (names) and options an array table"
  (let [pkgs (a.array)]
    (for [i 1 (a.count pairs) 2]
      (let [name (. pairs i)
            opts (. pairs (+ i 1))]
        (-?> (. opts :mod) (safe-require-plugin-config))
        (a.assoc opts 1 name)
        (a.push pkgs opts)))
    pkgs))

(defn use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well.

  This is just a helper / syntax sugar function to make interacting with packer
  a little more concise."
      (let [pkgs (fold-pairs [...])]
        (lazy.setup pkgs)
      nil)
