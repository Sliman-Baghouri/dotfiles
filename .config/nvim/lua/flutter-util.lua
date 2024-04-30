local api = vim.api
local M = {}

M.toggle_log = function()
  local wins = api.nvim_list_wins()

  for _, id in pairs(wins) do
    local bufnr = api.nvim_win_get_buf(id)
    if api.nvim_buf_get_name(bufnr):match '.*/([^/]+)$' == '__FLUTTER_DEV_LOG__' then
      return vim.api.nvim_win_close(id, true)
    end
  end

  pcall(function()
    local width = api.nvim_get_option('columns') -- Get the width of the screen
    local height = api.nvim_get_option('lines') -- Get the height of the screen
    vim.api.nvim_command('sb + __FLUTTER_DEV_LOG__') -- Open a new scratch buffer
    vim.api.nvim_win_set_height(0, height) -- Set the window height to full screen
    vim.api.nvim_win_set_width(0, width) -- Set the window width to full screen
    vim.api.nvim_command('normal! zz') -- Center the text in the buffer
  end)
end

return M

