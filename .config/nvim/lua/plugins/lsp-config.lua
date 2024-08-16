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

			local lspconfig = require("lspconfig")
			-- lspconfig.emmet_language_server.setup({
			-- 	filetypes = {
			-- 		"css",
			-- 		"eruby",
			-- 		"html",
			-- 		"javascript",
			-- 		"javascriptreact",
			-- 		"less",
			-- 		"sass",
			-- 		"scss",
			-- 		"pug",
			-- 		"typescriptreact",
			-- 	},
			-- 	-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
			-- 	-- **Note:** only the options listed in the table are supported.
			-- 	init_options = {
			-- 		---@type table<string, string>
			-- 		includeLanguages = {},
			-- 		--- @type string[]
			-- 		excludeLanguages = {},
			-- 		--- @type string[]
			-- 		extensionsPath = {},
			-- 		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
			-- 		preferences = {},
			-- 		--- @type boolean Defaults to `true`
			-- 		showAbbreviationSuggestions = true,
			-- 		--- @type "always" | "never" Defaults to `"always"`
			-- 		showExpandedAbbreviation = "always",
			-- 		--- @type boolean Defaults to `false`
			-- 		showSuggestionsAsSnippets = false,
			-- 		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
			-- 		syntaxProfiles = {},
			-- 		--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
			-- 		variables = {},
			-- 	},
			-- })
			-- lspconfig.tsserver.setup({
			-- 	on_attach = function(client)
			-- 		if client.config.flags then
			-- 			client.config.flags.allow_incremental_sync = true
			-- 		end
			-- 		client.resolved_capabilities.document_formatting = false
			-- 		set_lsp_config(client)
			-- 	end,
			--      })

			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
            single_file_support = true,
			})

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
