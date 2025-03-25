require("core.options")
require("core.keymaps")

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	import = "custom.plugins",
})

local color = {
  "catppuccin-mocha",
  "catppuccin-frappe",
  "catppuccin-macchiato",
  "tokyonight-moon",
  'tokyonight-storm',
  'tokyonight-night',
  'kanagawa-wave',
  'kanagawa-dragon',
  'rose-pine',
  'rose-pine-moon',
  'nightfox',
  'duskfox',
  'nordfox',
  'terafox',
  'carbonfox',
  'onedark',
  'nord',
  'oxocarbon',
  'dracula',
  'dracula-soft',
  'cyberdream',
  'vscode',
  'material-oceanic',
  'material-deep-ocean',
  'material-palenight',
  'material-darker',
  'everforest',
  'edge',
  'sonokai',
  'github_dark',
  'github_dark_default',
  'github_dark_dimmed',
  'darkvoid',                   -- transparent background!
}

math.randomseed(os.time())
vim.cmd.colorscheme(color[math.random(#color)])

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
