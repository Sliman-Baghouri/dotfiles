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

vim.api.nvim_set_keymap('n', '<C-t>', ':Telescope neoclip<CR>', { noremap = true, silent = true })

-- deno
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

vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
-- Lua
-- vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
-- vim.cmd.colorscheme("catppuccin");
vim.cmd.colorscheme("catppuccin")

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

require("telescope").setup({

  defaults = {
    file_ignore_patterns = {
      -- ignore dotnet generated folders in the file search
      "^bin/",
      "^obj/",
      "bin",
      "/obj/",
      "/^node_modules/",
      "/node_modules/",
      "ios",
      "assets",
      "/^.lock/",
      ".lock",
      -- ignore .git folders (usefull when using hidden=true option)
      "^.git/",
      ".git",
    },
  },

  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})


vim.g.nonels_suppress_issue58 = true
