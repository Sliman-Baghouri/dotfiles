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
  silent = true,
})

vim.wo.number = true




-- vim.keymap.set("n", "<c-P>", function() require('fzf-lua').files({ }) end, { desc = "Fzf Files" })
vim.api.nvim_set_keymap(
  'n', -- Normal mode
  '<C-p>', -- Key combination
  ":lua require('fzf-lua').files()<CR>", -- Command to execute
  { noremap = true, silent = true } -- Options: no recursive mapping, silent
)

vim.api.nvim_set_keymap(
  'n', -- Normal mode
  '<C-g>', -- Key combination
  ":lua require('fzf-lua').live_grep()<CR>", -- Command to execute
  { noremap = true, silent = true } -- Options: no recursive mapping, silent
)


-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.api.nvim_set_keymap('n', '<C-t>', ':Telescope neoclip<CR>', { noremap = true, silent = true })
-- vim.o.background = "light";
-- deno
--
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
require("vim-options")
require("lazy").setup("plugins")

require("settings")
require("keymaps")
F = require("flutter-util")
-- flutter-tool for toggling dev logs
vim.api.nvim_set_keymap('n', '<Tab>', ':lua F.toggle_log()<CR>', { noremap = true, silent = true })

-- Assuming the function is in utils.lua (modify if it's in init.lua)
vim.keymap.set("i", "<C-CR>", "<c-o>o")

require('tag_highlight').setup()

vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
-- Lua
-- vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

-- vim.cmd.colorscheme("alabaster")
-- vim.cmd.colorscheme('cold')
-- vim.cmd.colorscheme("catppuccin");
-- vim.cmd.colorscheme("grey")
-- vim.cmd.colorscheme("plan9")


require("rotate_window")

vim.api.nvim_create_user_command("DiagnosticToggle", function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config({
    virtual_text = not vt,
    underline = not vt,
    signs = not vt,
  })
end, { desc = "toggle diagnostic" })

vim.api.nvim_set_hl(0, "Pmenu", { bg = "#303030" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#4e4e4e" })

vim.g.nonels_suppress_issue58 = true

local set_color = vim.api.nvim_set_hl

set_color(0, 'Normal', { fg = '#cccccc' })  -- Light gray for normal text
set_color(0, 'Comment', { fg = '#666666', italic = false })  -- Darker gray for comments
set_color(0, 'String', { fg = '#bbbbbb', italic = false })  -- Slightly lighter for strings
set_color(0, 'Function', { fg = '#999999', italic = false })  -- Medium gray for functions

set_color(0, 'Search', { fg = '#000000', bg = '#888888' })  -- High contrast search
set_color(0, 'CurSearch', { fg = '#000000', bg = '#aaaaaa' })  -- Lighter active search

set_color(0, 'Identifier', { fg = '#888888', italic = false })  -- Neutral gray for identifiers

set_color(0, 'Special', { fg = '#777777', italic = false })  -- Uniform gray for special
set_color(0, 'Question', { fg = '#666666', italic = false })  -- Dark gray for questions

set_color(0, 'Directory', { fg = '#777777', italic = false })  -- Consistent gray for directories
set_color(0, 'NvimTreeFolderIcon', { fg = '#777777', italic = false })

set_color(0, 'DiffAdd', { fg = '#aaaaaa', italic = false })  -- Lighter gray for additions
set_color(0, 'DiffDelete', { fg = '#555555', italic = false })  -- Dark gray for deletions
set_color(0, 'DiffText', { fg = '#000000', bg = '#bbbbbb', italic = false })  -- Contrasting diff text
set_color(0, 'changed', { fg = '#cccccc', italic = false })  -- Light gray for changes

