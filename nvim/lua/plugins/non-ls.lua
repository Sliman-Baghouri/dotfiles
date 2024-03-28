return {
	"nvimtools/none-ls.nvim",
	branch = "0.7-compat",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
			  null_ls.builtins.formatting.stylua,
			  null_ls.builtins.formatting.prettier,
			  null_ls.builtins.diagnostics.erb_lint,
			  null_ls.builtins.diagnostics.eslint_d,
			  null_ls.builtins.completion.spell,
			},
		})
	end,
}
