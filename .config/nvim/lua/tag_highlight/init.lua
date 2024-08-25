local M = {}

local ts_utils = require("nvim-treesitter.ts_utils")
local api = vim.api

function M.clear_highlights()
    local ns_id = api.nvim_create_namespace("TagHighlight")
    api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
end

function M.highlight_matching_tag()
    -- Clear previous highlights
    M.clear_highlights()

    local node_at_cursor = ts_utils.get_node_at_cursor()
    if not node_at_cursor then return end

    -- Traverse upwards until we find the relevant element node
    local tag_node = node_at_cursor
    while tag_node do
        local node_type = tag_node:type()
        if node_type == "element" or node_type == "jsx_element" or node_type == "jsx_self_closing_element" then
            break
        end
        tag_node = tag_node:parent()
    end

    if not tag_node then return end

    -- Identify the start and end tag nodes
    local start_tag, end_tag

    -- Handling for regular HTML elements
    if tag_node:type() == "element" then
        start_tag = tag_node:child(0)
        end_tag = tag_node:child(tag_node:named_child_count() - 1)

    -- Handling for JSX/TSX elements
    elseif tag_node:type() == "jsx_element" then
        start_tag = tag_node:child(0)
        end_tag = tag_node:child(tag_node:named_child_count() - 1)

    -- Handling for self-closing JSX/TSX elements
    elseif tag_node:type() == "jsx_self_closing_element" then
        start_tag = tag_node
        end_tag = nil  -- No closing tag for self-closing elements
    end

    local ns_id = api.nvim_create_namespace("TagHighlight")

    -- Get cursor position
    local cursor_row, cursor_col = unpack(api.nvim_win_get_cursor(0))
    cursor_row = cursor_row - 1 -- Convert to zero-indexed

    -- Helper function to highlight a tag name
    local function highlight_tag(tag)
        local name_node = tag:child(1) -- Usually the tag name is the second child
        if name_node then
            local start_row, start_col, _, start_end_col = vim.treesitter.get_node_range(name_node)
            api.nvim_buf_add_highlight(0, ns_id, "Search", start_row, start_col, start_end_col)
        end
    end

    -- Check if cursor is on the start tag
    if start_tag and (start_tag:type() == "start_tag" or start_tag:type() == "jsx_opening_element") then
        local name_node = start_tag:child(1) -- Usually the tag name is the second child
        if name_node then
            local start_row, start_col, _, start_end_col = vim.treesitter.get_node_range(name_node)
            if cursor_row == start_row and cursor_col >= start_col and cursor_col <= start_end_col then
                highlight_tag(start_tag)
                if end_tag then
                    highlight_tag(end_tag)
                end
                return
            end
        end
    end

    -- Check if cursor is on the end tag
    if end_tag and (end_tag:type() == "end_tag" or end_tag:type() == "jsx_closing_element") then
        local name_node = end_tag:child(1) -- Usually the tag name is the second child
        if name_node then
            local end_row, end_col, _, end_end_col = vim.treesitter.get_node_range(name_node)
            if cursor_row == end_row and cursor_col >= end_col and cursor_col <= end_end_col then
                highlight_tag(end_tag)
                if start_tag then
                    highlight_tag(start_tag)
                end
                return
            end
        end
    end
end

function M.setup()
    api.nvim_exec([[
        augroup TagHighlight
            autocmd!
            autocmd CursorMoved * lua require'tag_highlight'.highlight_matching_tag()
        augroup END
    ]], false)
end

return M
