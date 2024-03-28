-- flash.lua

local flashKeymaps = require("keymaps").flash

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    highlight = {
      backdrop = false,
    },
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  keys = vim.tbl_map(function(mapping)
    return {
      mapping[1],
      mode = mapping.mode,
      function()
        require("flash")[mapping.action]()
      end,
      desc = mapping.desc,
    }
  end, flashKeymaps()),
}
