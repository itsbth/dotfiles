-- Welcome to your magic kit
-- This is the first file Neovim will load.
-- We'll ensure we have a plugin manager and Aniseed.
-- This will allow us to load more Fennel based code and download more plugins.

-- Make some modules easier to access.
local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

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

-- Work out where our plugins will be stored.
local pack_path = fn.stdpath("data") .. "/lazy"

function ensure(user, repo)
	-- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
	local install_path = fmt("%s/%s", pack_path, repo)
	if fn.empty(fn.glob(install_path)) > 0 then
		execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    -- lazy doesn't use the standard packadd command, so we need to load it manually.
	end
  vim.opt.rtp:prepend(install_path)
end

-- Aniseed compiles our Fennel code to Lua and loads it automatically.
ensure("Olical", "aniseed")

-- Enable Aniseed's automatic compilation and loading of Fennel source code.
-- Aniseed looks for this when it's loaded then loads the rest of your
-- configuration if it's set.
vim.g["aniseed#env"] = { module = "magic.init", compile = true }
-- WIP: Make sure fnl is in rtp before loading aniseed to get (include) working(?)
vim.opt.rtp:prepend('~/.config/nvim/fnl')
require('aniseed.env').init()

-- Now head to fnl/magic/init.fnl to continue your journey.
-- Try pressing gf on the file path to [g]o to the [f]ile.

