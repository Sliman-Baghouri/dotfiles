return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end
			require("telescope.pickers")
				.new({}, {
					prompt_title = "harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		harpoon:setup({
			global_settings = {
				-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
				save_on_toggle = false,

				-- saves the harpoon file upon every change. disabling is unrecommended.
				save_on_change = true,

				-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendcommand`.
				enter_on_sendcmd = false,

				-- closes any tmux windows harpoon that harpoon creates when you close neovim.
				tmux_autoclose_windows = false,

				-- filetypes that you want to prevent from adding to the harpoon list menu.
				excluded_filetypes = { "harpoon", "dashboard", "gitcommit" },
				-- set marks specific to each git branch inside git repository
				mark_branch = true,

				-- enable tabline with harpoon marks
				tabline = false,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
			},
		})



		vim.keymap.set("n", "<M-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<M-x>", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<A-n>", function()
			harpoon:list():next()
		end)

		vim.keymap.set("n", "<A-p>", function()
			harpoon:list():prev()
		end)

		vim.keymap.set("n", "<A-i>", function()
			toggle_telescope(harpoon:list())
		end)


		vim.keymap.set("n", "<c-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<c-j>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<c-k>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<c-l>", function()
			harpoon:list():select(4)
		end)
	end,
}
