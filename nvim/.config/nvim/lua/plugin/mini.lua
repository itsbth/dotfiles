-- [nfnl] Compiled from fnl/plugin/mini.fnl by https://github.com/Olical/nfnl, do not edit.
local _1_ = {}
local function config()
  local surr = require("mini.surround")
  local mpair = require("mini.pairs")
  local comm = require("mini.comment")
  surr.setup({})
  mpair.setup({})
  return comm.setup({})
end
table.insert(_1_, {"echasnovski/mini.nvim", config = config})
return _1_
