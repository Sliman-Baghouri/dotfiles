
return {
	"Sliman-Baghouri/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "stevearc/dressing.nvim", -- optional for vim.ui.select
	},

	config = function()
		local dartExcludedFolders = {
			vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
			vim.fn.expand("$HOME/.pub-cache"),
			vim.fn.expand("$HOME/Downloads/flutter"),
			vim.fn.expand("$HOME/tools/flutter/"),
		}

		require("flutter-tools").setup({
			ui = {
				border = "rounded",
				notification_style = "native",
			},
			decorations = {
				statusline = {
					app_version = false,
					device = false,
					project_config = false,
				},
			},
			widget_guides = {
				enabled = false,
			},
			debugger = {
				enabled = true,
				run_via_dap = true,
				exception_breakpoints = {},
				register_configurations = function(_)
					require("dap").dart = {
						type = "executable",
						command = "dart",
						args = { "debug_adapter" },
					}
					require("dap").adapters.flutter = {
						type = "executable",
						command = "flutter",
						args = { "debug_adapter" },
					}
					require("dap").configurations.dart = {
						{
							type = "dart",
							request = "launch",
							name = "Launch dart",
							dartSdkPath = "$HOME/Downloads/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
							flutterSdkPath = "$HOME/Downloads/flutter/bin/flutter", -- ensure this is correct
							program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
							cwd = "${workspaceFolder}",
						},
					}

					require("dap").configurations.flutter = {
						{
							type = "flutter",
							request = "launch",
							name = "Launch flutter",
							dartSdkPath = "$HOME/Downloads/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
							flutterSdkPath = "$HOME/Downloads/flutter/bin/flutter", -- ensure this is correct
							program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
							cwd = "${workspaceFolder}",
						},
					}

					require("dap.ext.vscode").load_launchjs()
				end,
			},
  -- closing_tags = {
  --   highlight = "ErrorMsg", -- highlight for the closing tag
  --   prefix = ">", -- character to use for close tag e.g. > Widget
  --   enabled = true -- set to false to disable
  -- },
  dev_log = {
    enabled = true, -- turn on/off the debug logger
    notify_errors = false, -- if there is an error whilst running then notify the user
    open_cmd = "tabedit", -- command to use to open the log buffer
  },

			lsp = {
				color = { -- show the derived colours for dart variables
					enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
					background = false, -- highlight the background
					background_color = nil,
					foreground = false, -- highlight the foreground
					virtual_text = true, -- show the highlight using virtual text
					virtual_text_str = "■", -- the virtual text character to highlight
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					analysisExcludedFolders = dartExcludedFolders,
					renameFilesWithClasses = "prompt",
					enableSnippets = true,
					updateImportsOnRename = true,
				},
			},
		})
	end,
}
