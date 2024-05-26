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

			lspconfig.denols.setup({
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
				init_options = {
					lint = true,
					unstable = true,
					suggest = {
						imports = {
							hosts = {
								["https://deno.land"] = true,
								["https://cdn.nest.land"] = true,
								["https://crux.land"] = true,
							},
						},
					},
				},

				on_attach = on_attach,
			})

			lspconfig.tsserver.setup({
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					vim.keymap.set("n", "<leader>ro", function()
						vim.lsp.buf.execute_command({
							command = "_typescript.organizeImports",
							arguments = { vim.fn.expand("%:p") },
						})
					end, { buffer = bufnr, remap = false })
				end,
				root_dir = function(filename, bufnr)
					local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.json")(filename)
					if denoRootDir then
						-- print('this seems to be a deno project; returning nil so that tsserver does not attach');
						return nil
						-- else
						-- print('this seems to be a ts project; return root dir based on package.json')
					end

					return lspconfig.util.root_pattern("package.json")(filename)
				end,
				single_file_support = false,
			})
			-- lspconfig.tsserver.setup {
			--   on_attach = on_attach,
			--   root_dir = lspconfig.util.root_pattern("package.json"),
			--   single_file_support = false
			-- }

			-- lspconfig.denols.setup {
			--   on_attach = function(client)
			--     client.resolved_capabilities.document_formatting = false
			--     client.resolved_capabilities.document_range_formatting = false
			--     set_lsp_config(client)
			--   end,
			--   root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			-- }

			-- lspconfig.tsserver.setup {
			--   on_attach = function(client)
			--     if client.config.flags then
			--       client.config.flags.allow_incremental_sync = true
			--     end
			--     client.resolved_capabilities.document_formatting = false
			--     set_lsp_config(client)
			--   end,
			--   root_dir = lspconfig.util.root_pattern("package.json"),
			--   single_file_support = false
			-- }

			-- lspconfig.tsserver.setup({
			-- 	on_attach = function(client)
			-- 		if client.config.flags then
			-- 			client.config.flags.allow_incremental_sync = true
			-- 		end
			-- 		client.resolved_capabilities.document_formatting = false
			-- 		set_lsp_config(client)
			-- 	end,
			--      })

			-- lspconfig.tsserver.setup({
			-- capabilities = capabilities,
			-- })
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
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
