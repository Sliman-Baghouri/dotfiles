return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",
      dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },

  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "lua", "vim", "dart", "vimdoc", "query", "heex", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = {
          "dart",
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>", -- set to `false` to disable one of the mappings
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
