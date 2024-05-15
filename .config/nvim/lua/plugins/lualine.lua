return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local colors = {
			bg = "#161617",
			fg = "#c9c7cd",
			bg_dark = "#131314",
			black = "#27272a",
			red = "#ea83a5",
			green = "#90b99f",
			yellow = "#e6b99d",
			purple = "#aca1cf",
			magenta = "#e29eca",
			orange = "#f5a191",
			blue = "#92a2d5",
			lavender = "#a4a6c9",
			cyan = "#85b5ba",
			bright_black = "#353539",
			bright_red = "#f591b2",
			bright_green = "#9dc6ac",
			bright_yellow = "#f0c5a9",
			bright_purple = "#b9aeda",
			bright_magenta = "#ecaad6",
			bright_orange = "#ffae9f",
			bright_blue = "#a6b6e9",
			bright_cyan = "#99c9ce",
			gray0 = "#18181a",
			gray1 = "#1b1b1c",
			gray2 = "#2a2a2c",
			gray3 = "#313134",
			gray4 = "#3b3b3e",
			-- Special
			none = "NONE",
		}
		local filename = {
			"filename",
			color = { bg = colors.blue, fg = colors.bg, gui = "bold" },
			separator = { left = "", right = "" },
		}

		local space = {
			function()
				return "→"
			end,
			color = { bg = colors.bg_dark, fg = colors.blue },
		}
		require("lualine").setup({
			options = {
				-- theme = "catppuccin",
				component_separators = " ",
				section_separators = { left = "", right = "" },
			},

			sections = {
				lualine_c = {
					space,
					filename,
				},
			},
			inactive_sections = {
				lualine_x = { "location" },
				lualine_c = { "filename" },
			},
		})
	end,
}
