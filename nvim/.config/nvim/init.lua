--- make sure that a package is installed
--- @param url string
--- @param opts {name: string, path: string, ref: string}
local function bootstrap(url, opts)
    local name = opts.name or url:gsub(".*/(.+)%.git", "%1") or url:gsub(".*/", "")
    local path = opts.path or (vim.fn.stdpath("data") .. "/lazy/" .. name)

    if vim.fn.isdirectory(path) == 0 then
        print(name .. ": installing in data dir...")
	if opts.ref then
		vim.fn.system {"git", "clone", url, "--branch=" .. opts.ref, path}
	else
		vim.fn.system {"git", "clone", url, path}
	end

        vim.cmd "redraw"
        print(name .. ": finished installing")
    end
    vim.opt.rtp:prepend(path)
end

-- for stable version [recommended]
bootstrap("https://github.com/folke/lazy.nvim.git", {ref = "stable"})
bootstrap("https://github.com/Olical/nfnl.git", {})
bootstrap("https://github.com/udayvir-singh/hibiscus.nvim.git", {ref = "v1.7"})

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.termguicolors = true
vim.opt.exrc = true

vim.cmd.colorscheme "habamax"

require'lazy'.setup 'plugin'
