-- [nfnl] Compiled from fnl/plugin/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function key(key0, action, opts)
  opts[1] = key0
  opts[2] = action
  return opts
end
local _1_ = {}
table.insert(_1_, {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}, opts = {}, cmd = "Telescope", keys = {key("<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", {desc = "Find Files"})}})
return _1_
