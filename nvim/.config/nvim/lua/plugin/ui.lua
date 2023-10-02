-- [nfnl] Compiled from fnl/plugin/ui.fnl by https://github.com/Olical/nfnl, do not edit.
local _1_ = {}
table.insert(_1_, {"folke/noice.nvim", event = "VeryLazy", dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}, opts = {lsp = {override = {["vim.lsp.util.convert_input_to_markdown_lines"] = true, ["vim.lsp.util.stylize_markdown"] = true, ["cmp.entry.get_documentation"] = true}}, presets = {bottom_search = true, command_palette = true, long_message_to_split = true, inc_rename = false, lsp_doc_border = false}}})
table.insert(_1_, {"akinsho/bufferline.nvim", opts = {options = {offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true}}}}, dependencies = {"nvim-tree/nvim-web-devicons"}})
return _1_
