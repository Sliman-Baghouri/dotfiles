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

local keymap = vim.api.nvim_set_keymap

keymap("n", "<esc>", ":noh<cr>", {
  noremap = true,
  silent = true
})  

vim.wo.number = true
local opts = {}

require("vim-options")
require("lazy").setup("plugins")

require("settings")
require("keymaps")

vim.keymap.set("i", "<C-CR>", "<c-o>o")


vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
-- Lua
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
vim.cmd.colorscheme("tokyonight-night")

require("rotate_window")

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })


vim.g.nonels_suppress_issue58 = true
