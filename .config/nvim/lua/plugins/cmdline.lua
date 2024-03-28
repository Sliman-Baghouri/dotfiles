return {
	"VonHeikemen/fine-cmdline.nvim",
	dependences = {
		{ "MunifTanjim/nui.nvim" },
	},
	config = function()
		require("fine-cmdline").setup({
			popup = {
				position = {
					row = "50%",
					col = "50%",
				},
			},
		})
	end,
}
