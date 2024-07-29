return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
			-- now show all open buffers
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({

				defaults = {
					file_ignore_patterns = {
						-- ignore dotnet generated folders in the file search
						"^bin/",
						"^obj/",
						"bin",
						"/obj/",
						"/^node_modules/",
						"/node_modules/",
						"node_modules",
						"ios",
						"assets",
						"/^.lock/",
						".lock",
						-- ignore .git folders (usefull when using hidden=true option)
						"^.git/",
						".git",
					},
				},

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
      require("telescope").load_extension("ui-select");
		end,
	},
}
