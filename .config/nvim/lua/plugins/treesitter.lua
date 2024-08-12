return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},

	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"json",
				"http",
				"sql",
				"css",
				"scss",
				"dart",
				"vimdoc",
				"query",
				"heex",
				"javascript",
				"markdown",
				"html",
				"tsx",
			},
			config = {
				javascript = {
					__default = "// %s",
					jsx_element = "{/* %s */}",
					jsx_fragment = "{/* %s */}",
					jsx_attribute = "// %s",
					comment = "// %s",
				},
				typescript = { __default = "// %s", __multiline = "/* %s */" },
			},
			sync_install = false,
			highlight = { enable = true },
			indent = {
				enable = true,
				disable = {
					"dart",
				},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>", -- set to `false` to disable one of the mappings
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
