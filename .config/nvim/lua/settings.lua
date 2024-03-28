vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "Highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 200, visual = true })
	end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
-- 	pattern = "*",
-- 	desc = "Run LSP formatting on a file on save",
-- 	callback = function()
-- 		vim.lsp.buf.format({ async = true })
-- 	end,
-- })
