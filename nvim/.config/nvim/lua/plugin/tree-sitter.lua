-- [nfnl] Compiled from fnl/plugin/tree-sitter.fnl by https://github.com/Olical/nfnl, do not edit.
local _1_ = {}
local ensure_installed = {"javascript", "typescript", "fennel", "tsx", "html", "css", "json", "toml", "yaml"}
table.insert(_1_, {"nvim-treesitter/nvim-treesitter", opts = {highlight = {enable = true}, incremental_selection = {enable = true}, textobjects = {enable = true}, indent = {enable = true, disable = {"python"}}, ensure_installed = ensure_installed}, main = "nvim-treesitter.configs"})
return _1_
