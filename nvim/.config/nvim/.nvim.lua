-- [nfnl] Compiled from .nvim.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local autogroup = vim.api.nvim_create_augroup("local_insert_boilerplate", {clear = true})
  local function _1_()
    return vim.api.nvim_buf_set_lines(0, 0, 0, false, {"(import-macros {: module! : use-package! : fin!} :macros)", "(module!)", "(fin!)"})
  end
  vim.api.nvim_create_autocmd("BufNewFile", {group = autogroup, pattern = {"*.fnl"}, callback = _1_})
end
local lspc = require("lspconfig")
return lspc.fennel_ls.setup({init_options = {}})
