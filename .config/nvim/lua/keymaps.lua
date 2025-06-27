local nnoremap = require("utils").nnoremap
local vnoremap = require("utils").vnoremap
local inoremap = require("utils").inoremap
local tnoremap = require("utils").tnoremap
local xnoremap = require("utils").xnoremap
--


local TERM = os.getenv("TERM")

-- Keymaps for the lazygit plugin
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
-- keymaps for the flutter tools  plugin
vim.api.nvim_set_keymap('n', '<leader>ff', ':FlutterDevices<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rr', ':FlutterRestart<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fq', ':FlutterQuit<CR>', { noremap = true, silent = true })

-- Normal --
-- Disable Space bar since it'll be used as the leader key
nnoremap("<space>", "<nop>")
-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")

nnoremap("<leader>oc", function()
	require("copilot.panel").open({})
end, { desc = "[O]pen [C]opilot panel" })


nnoremap("S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("L", "$")
nnoremap("H", "^")

-- Press leader f to format
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Press leader rw to rotate open windows
nnoremap("<leader>rw", ":RotateWindows<cr>", { desc = "[R]otate [W]indows" })

nnoremap("]d", function()
  vim.diagnostic.goto_next({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous diagnostic of any severity
nnoremap("[d", function()
  vim.diagnostic.goto_prev({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next error diagnostic
nnoremap("]e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous error diagnostic
nnoremap("[e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next warning diagnostic
nnoremap("]w", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous warning diagnostic
nnoremap("[w", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Place all dignostics into a qflist
nnoremap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m

nnoremap("<leader>m", ":MaximizerToggle<cr>")

-- Press gx to open the link under the cursor

nnoremap("gx", ":sil !open <cWORD><cr>", { silent = true })

-- keymaps for oil plugin
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- keymaps for dap plugin

local dap = require("dap")
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})

-- keymaps for flash plugin
local keymaps = {}
keymaps.flash = function()
  return {
    -- Keymaps specifically for the flash plugin
    { "s",     mode = { "n", "x", "o" }, action = "jump",              desc = "Flash" },
    { "K",     mode = { "n", "x", "o" }, action = "treesitter",        desc = "Flash Treesitter" },
    { "r",     mode = "o",               action = "remote",            desc = "Remote Flash" },
    { "R",     mode = { "o", "x" },      action = "treesitter_search", desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           action = "toggle",            desc = "Toggle Flash Search" },
  }
end

-- keymaps for flutter-tools plugin

-- keymas for harpoon plugin

-- keymaps for lsp-config plugin
keymaps.lsp_config = function(ev)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = ev.buf }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  -- vim.keymap.set("n", "<space>f", function()
  -- 	vim.lsp.buf.format({ async = true })
  -- end, opts)
  --
end
-- General keymaps
vim.api.nvim_set_keymap("n", "<Leader>v", ":vsp<CR>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true })

-- Toggle the quickfix list
vim.api.nvim_set_keymap('n', '<leader>q', [[:lua ToggleQuickfix()<CR>]], { noremap = true, silent = true })

-- Function to toggle the quickfix list
function ToggleQuickfix()
  local qf_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      qf_open = true
      break
    end
  end
  if qf_open then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end


-- Function to open the HTML file
local function open_html_file()
  vim.ui.open(vim.fn.expand('%'))
end

-- Keybinding to open the HTML file
vim.keymap.set('n', '<leader>h', open_html_file, { desc = 'Open HTML file' })


-- Map Tab to :bnext
-- vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })

-- Map Shift + Tab to :bprev
-- vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

tnoremap("<space>", "<space>")

vim.api.nvim_set_keymap('n', 'md', ':MarkdownPreview<CR>', { noremap = true, silent = true })

-- Neovim Lua: transform visual selection from Figma token (slashes & spaces) to camelCase
local api = vim.api
local fn = vim.fn

local function selection_to_camelcase()
  -- Save current mode to detect if we're in visual mode
  local mode = api.nvim_get_mode().mode
  
  -- Handle potential mode issues by ensuring we process the selection correctly
  if not (mode:sub(1,1) == 'v' or mode:sub(1,1) == 'V' or mode == '\22') then
    print("Please select text first")
    return
  end
  
  -- Force exit from visual mode first to ensure marks are set
  local esc = api.nvim_replace_termcodes("<Esc>", true, false, true)
  api.nvim_feedkeys(esc, 'nx', true)
  
  -- A small delay to ensure Vim has updated the marks
  vim.defer_fn(function()
    -- Get buffer and selection range
    local bufnr = api.nvim_get_current_buf()
    
    -- Get marks from visual selection
    local s_pos = fn.getpos("'<")
    local e_pos = fn.getpos("'>")
    
    if not s_pos or not e_pos then
      print("Could not get selection bounds")
      return
    end
    
    -- Extract row and column information
    local s_row, s_col = s_pos[2], s_pos[3]
    local e_row, e_col = e_pos[2], e_pos[3]
    
    -- Normalize order
    if s_row > e_row or (s_row == e_row and s_col > e_col) then
      s_row, e_row = e_row, s_row
      s_col, e_col = e_col, s_col
    end
    
    -- Convert selection coordinates to zero-indexed
    local s_c0 = math.max(0, s_col - 1)
    local e_c0 = e_col
    
    -- Safety check to ensure we're within buffer bounds
    local line_count = api.nvim_buf_line_count(bufnr)
    if s_row > line_count or e_row > line_count then
      print("Selection extends beyond buffer bounds")
      return
    end
    
    -- Get line lengths for bounds checking
    local s_line = api.nvim_buf_get_lines(bufnr, s_row - 1, s_row, false)[1] or ""
    local e_line = api.nvim_buf_get_lines(bufnr, e_row - 1, e_row, false)[1] or ""
    
    if s_c0 > #s_line then s_c0 = #s_line end
    if e_c0 > #e_line then e_c0 = #e_line end
    
    -- Retrieve exactly selected text with proper error handling
    local parts
    pcall(function()
      parts = api.nvim_buf_get_text(bufnr, s_row - 1, s_c0, e_row - 1, e_c0, {})
    end)
    
    if not parts or #parts == 0 then
      print("Failed to get selected text")
      return
    end
    
    local text = table.concat(parts, "")
    if text == "" then
      print("Empty selection")
      return
    end
    
    -- Build camelCase in one pass with improved handling
    local result = ""
    local first_segment = true
    
    for segment in text:gmatch("[^/]+") do
      -- Skip empty segments
      if segment:gsub("%s", "") ~= "" then
        -- Process the segment: capitalize after spaces, remove spaces
        segment = segment:gsub("%s+(%w)", function(c) return c:upper() end):gsub("%s+", "")
        
        if first_segment then
          -- First segment starts with lowercase
          if #segment > 0 then
            result = segment:sub(1,1):lower() .. segment:sub(2)
            first_segment = false
          end
        else
          -- Following segments start with uppercase
          if #segment > 0 then
            result = result .. (segment:sub(1,1):upper() .. segment:sub(2))
          end
        end
      end
    end
    
    -- Safely replace the selection with the new text
    pcall(function()
      api.nvim_buf_set_text(bufnr, s_row - 1, s_c0, e_row - 1, e_c0, { result })
    end)
    
    -- Position cursor at beginning of word and enter insert mode
    pcall(function()
      api.nvim_win_set_cursor(0, {s_row, s_c0})
    end)
  end, 10) -- 10ms delay should be sufficient
end

-- Map in visual mode
vim.keymap.set('v', '<C-f>', selection_to_camelcase, { desc = "Convert Figma token to camelCase" })

return keymaps

