-- [nfnl] Compiled from fnl/plugin/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local _1_ = {}
table.insert(_1_, {"williamboman/mason.nvim", opts = {}})
local function _2_(opts)
  local mlspc = require("mason-lspconfig")
  mlspc.setup(opts)
  return mlspc.setup_handlers({})
end
table.insert(_1_, {"williamboman/mason-lspconfig.nvim", dependencies = {"williamboman/mason.nvim"}, opts = {ensure_installed = {"lua_ls"}}, setup = _2_})
table.insert(_1_, {"neovim/nvim-lspconfig", dependencies = {"williamboman/mason-lspconfig.nvim"}})
return _1_
