return {
	{
		"catppuccin/nvim",
		lazy = true,
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				styles = {
					comments = { "italic" },
					functions = { "bold" },
					keywords = { "italic" },
					operators = { "bold" },
					conditionals = { "bold" },
					loops = { "bold" },
					booleans = { "bold", "italic" },
					numbers = {},
					types = {},
					strings = {},
					variables = {},
					properties = {},
				},
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					lsp_trouble = true,
					cmp = true,
					gitsigns = true,
					-- telescope = {
					--     enabled = true,
					--     style = "nvchad",
					-- },
					-- hop = true,
					flash = true,
					mason = true,
					indent_blankline = {
						enabled = true,
						scope_color = "surface2", -- catppuccin color (eg. `lavender`) Default: text
						-- colored_indent_levels = true,
					},
					markdown = true,
					noice = false,
					neotree = true,
					notify = false,
					illuminate = true,
					rainbow_delimiters = true,
				},
				color_overrides = {
					mocha = {
					    base = "#131020",
					    mantle = "#110e1c",
					    crust = "#0f0c19",
					},
					-- mocha = {
					-- 	base = "#000000",
					-- 	mantle = "#000000",
					-- 	crust = "#000000",
					-- },
				},
				custom_highlights = function(C)
					return {
						PmenuSel = { bg = C.blue, fg = C.base },
						Pmenu = { fg = C.text, bg = C.base },
						CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
						CmpItemKindKeyword = { fg = C.base, bg = C.red },
						CmpItemKindText = { fg = C.base, bg = C.teal },
						CmpItemKindMethod = { fg = C.base, bg = C.pink },
						CmpItemKindConstructor = { fg = C.base, bg = C.pink },
						CmpItemKindFunction = { fg = C.base, bg = C.pink },
						CmpItemKindFolder = { fg = C.base, bg = C.pink },
						CmpItemKindModule = { fg = C.base, bg = C.pink },
						CmpItemKindConstant = { fg = C.base, bg = C.peach },
						CmpItemKindField = { fg = C.base, bg = C.green },
						CmpItemKindProperty = { fg = C.base, bg = C.green },
						CmpItemKindEnum = { fg = C.base, bg = C.green },
						CmpItemKindUnit = { fg = C.base, bg = C.green },
						CmpItemKindClass = { fg = C.base, bg = C.yellow },
						CmpItemKindVariable = { fg = C.base, bg = C.yellow },
						CmpItemKindFile = { fg = C.base, bg = C.pink },
						CmpItemKindInterface = { fg = C.base, bg = C.yellow },
						CmpItemKindColor = { fg = C.base, bg = C.red },
						CmpItemKindReference = { fg = C.base, bg = C.red },
						CmpItemKindEnumMember = { fg = C.base, bg = C.red },
						CmpItemKindStruct = { fg = C.base, bg = C.pink },
						CmpItemKindValue = { fg = C.base, bg = C.peach },
						CmpItemKindEvent = { fg = C.base, bg = C.pink },
						CmpItemKindOperator = { fg = C.base, bg = C.pink },
						CmpItemKindTypeParameter = { fg = C.base, bg = C.pink },
						CmpItemKindCopilot = { fg = C.base, bg = C.teal },
					}
				end,
				highlight_overrides = {
					mocha = function(cp)
						return {
							HopNextKey = { fg = cp.yellow, style = { "bold" } },
							HopNextKey1 = { fg = cp.blue, style = { "bold" } },
							HopNextKey2 = { fg = cp.teal, style = { "bold", "italic" } },
							HopUnmatched = { fg = cp.overlay0 },
							Comment = { fg = cp.overlay1, style = { "italic" } },
							CursorLineNr = { fg = cp.green },
							LineNr = { fg = cp.overlay2 },
							Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
							IncSearch = { bg = cp.pink, fg = cp.surface1 },
							CmpItemAbbr = { fg = cp.text },
							CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
							CmpItemMenu = { fg = cp.lavender, style = { "italic" } },
						}
					end,
					latte = function(cp)
						return {
							HopNextKey = { fg = cp.red, style = { "bold" } },
							HopNextKey1 = { fg = cp.blue, style = { "bold" } },
							HopNextKey2 = { fg = cp.teal, style = { "bold", "italic" } },
							HopUnmatched = { fg = cp.overlay0 },
							Comment = { fg = cp.overlay1, style = { "italic" } },
							CursorLineNr = { fg = cp.green },
							LineNr = { fg = cp.overlay2 },
							Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
							IncSearch = { bg = cp.pink, fg = cp.surface1 },
							CmpItemAbbr = { fg = cp.text },
							CmpItemAbbrMatch = { fg = cp.lavender, style = { "bold" } },
						}
					end,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
