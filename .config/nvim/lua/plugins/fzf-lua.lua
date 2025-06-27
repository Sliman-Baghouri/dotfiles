return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
          ["tab"] = "down",        -- Make Tab act like Down arrow
          ["shift-tab"] = "up",    -- Make Shift-Tab act like Up arrow
        },
      },
      grep = {
        rg_glob = true,
        glob_flag = "--iglob",
        glob_separator = "%s%-%-",
        cmd = "rg --vimgrep --hidden --line-number --column --glob '!staging/**'",
        actions = {
          ["default"] = require("fzf-lua.actions").file_edit,
        }
      },
    })
  end
}
