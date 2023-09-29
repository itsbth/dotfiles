-- [nfnl] Compiled from lua/plugin/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local _1_ = {}
local function sauce(name)
  return {name = name}
end
local function config()
  local cmp = require("cmp")
  local lsnip = require("luasnip")
  local function _2_(args)
    return lsnip.lsp_expand(args.body)
  end
  return cmp.setup({snippet = {expand = _2_}, mapping = cmp.mapping.preset.insert({["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-F>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = true})}), sources = cmp.config.sources({sauce("nvim_lsp"), sauce("buffer"), sauce("path"), sauce("luasnip")})})
end
table.insert(_1_, {"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"}, config = config})
return _1_
