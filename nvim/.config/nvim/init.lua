-- TODO: This no longer allows for bootstrapping (indeed, it'd be impossible to start from a fresh install now)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Enable Aniseed's automatic compilation and loading of Fennel source code.
-- Aniseed looks for this when it's loaded then loads the rest of your
-- configuration if it's set.
vim.g["aniseed#env"] = { module = "magic.init", compile = true }

-- Now head to fnl/magic/init.fnl to continue your journey.
-- Try pressing gf on the file path to [g]o to the [f]ile.

-- require("lazy").setup({"Olical/aniseed"})

-- add aniseed to rtp
vim.opt.rtp:append(vim.fn.stdpath("data") .. "/lazy/aniseed")
