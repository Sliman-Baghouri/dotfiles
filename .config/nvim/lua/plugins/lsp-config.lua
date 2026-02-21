return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()

		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfigKeymaps = require("keymaps").lsp_config

			if vim.lsp.config then
				vim.lsp.config("*", {
					capabilities = capabilities,
				})

				vim.lsp.config("ts_ls", {})
				vim.lsp.config("html", {})
				vim.lsp.config("tailwindcss", {
					settings = {
						tailwindCSS = {
							classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
						},
					},
				})
				vim.lsp.config("lua_ls", {
					single_file_support = true,
				})

				vim.lsp.enable({ "ts_ls", "html", "tailwindcss", "lua_ls" })
			else
				local lspconfig = require("lspconfig")

				lspconfig.ts_ls.setup({
					capabilities = capabilities,
				})
				lspconfig.html.setup({
					capabilities = capabilities,
				})
				lspconfig.tailwindcss.setup({
					capabilities = capabilities,
					settings = {
						tailwindCSS = {
							classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
						},
					},
				})
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					single_file_support = true,
				})
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					lspconfigKeymaps(ev)
				end,
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = false,
			})

			local dartExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("$HOME/Downloads/flutter"),
				vim.fn.expand("$HOME/tools/flutter/"),
			}

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
