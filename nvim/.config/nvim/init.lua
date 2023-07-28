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
bootstrap("https://github.com/udayvir-singh/tangerine.nvim.git", {ref = "v2.6"})
bootstrap("https://github.com/udayvir-singh/hibiscus.nvim.git", {ref = "v1.7"})

require 'tangerine'.setup {
	compiler = {
		hooks = {"onsave", "oninit"}
	}
}
