; from https://github.com/Olical/dotfiles/blob/2d5c73c23b773ceba5e535729073b40137eabe1f/stowed/.config/nvim/fnl/dotfiles/util.fnl
; licensed under the unlicense

(module dotfiles.util
  {require {nvim aniseed.nvim}})

(defn expand [path]
  (nvim.fn.expand path))

(defn glob [path]
  (nvim.fn.glob path true true true))

(defn exists? [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file [path]
  (nvim.ex.luafile path))

(def config-path (nvim.fn.stdpath "config"))

(defn nnoremap [from to]
  (nvim.set_keymap
    :n
    (.. "<leader>" from)
    (.. ":" to "<cr>")
    {:noremap true}))
