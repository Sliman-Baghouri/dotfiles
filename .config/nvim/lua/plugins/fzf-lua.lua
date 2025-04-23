return{
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
      grep = {
        rg_glob = true,          -- Enable glob parsing
        glob_flag = "--iglob",   -- Case insensitive globs
        glob_separator = "%s%-%-", -- Separator pattern
        cmd = "rg --vimgrep --hidden --line-number --column --glob '!staging/**'", 
        -- silent = true,
      },
    })
  end
}
