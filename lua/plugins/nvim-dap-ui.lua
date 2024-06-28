-- Debugging Support
return {
	'rcarriga/nvim-dap-ui',
	event = 'VeryLazy',
	dependencies = {
		'mfussenegger/nvim-dap',
		'nvim-neotest/nvim-nio',
		'theHamsta/nvim-dap-virtual-text', -- inline variable text while debugging
		'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap
	},
	opts = {
		controls = {
			element = "repl",
			enabled = false,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = ""
			}
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" }
			}
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = ""
		},
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.40
					},
					{
						id = "stacks",
						size = 0.20
					},
					{
						id = "watches",
						size = 0.20
					},
					{
						id = "breakpoints",
						size = 0.20
					}
				},
				size = 40,
				position = "left", -- Can be "left" or "right"
			},
			{
				elements = {
					{
						id = "repl",
						size = 0.35
					},
					{
						id = "console",
						size = 0.65
					},
				},
				size = 20,
				position = "bottom", -- Can be "bottom" or "top"
			}
		},
		mappings = {
			edit = "e",
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t"
		},
		render = {
			indent = 1,
			max_value_lines = 100
		}
	},
	config = function(_, opts)
		local dap = require('dap')
		require('dapui').setup(opts)

		dap.listeners.after.event_initialized["dapui_config"] = function()
			require('dapui').open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			-- Commented to prevent DAP UI from closing when unit tests finish
			-- require('dapui').close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			-- Commented to prevent DAP UI from closing when unit tests finish
			-- require('dapui').close()
		end

		-- Add dap configurations based on your language/adapter settings
		-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		dap.configurations.java = {
			--[[ {
				name = "Debug Launch (2GB)",
				type = 'java',
				request = 'launch',
				vmArgs = "" ..
					"-Xmx2g "
			}, ]]
			--[[ {
				name = "Debug Attach (8000)",
				type = 'java',
				request = 'attach',
				hostName = "127.0.0.1",
				port = 8000,
			}, ]]
			--[[ {
				name = "Debug Attach (5005)",
				type = 'java',
				request = 'attach',
				hostName = "127.0.0.1",
				port = 5005,
			}, ]]
			--[[ {
				name = "My Custom Java Run Configuration",
				type = "java",
				request = "launch",
				-- You need to extend the classPath to list your dependencies.
				-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
				-- classPaths = {},

				-- If using multi-module projects, remove otherwise.
				-- projectName = "yourProjectName",

				-- javaExec = "java",
				mainClass = "replace.with.your.fully.qualified.MainClass",

				-- If using the JDK9+ module system, this needs to be extended
				-- `nvim-jdtls` would automatically populate this property
				-- modulePaths = {},
				vmArgs = "" ..
					"-Xmx2g "
			}, ]]
		}
		local dapIcon = {
			Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
			Breakpoint          = " ",
			BreakpointCondition = " ",
			BreakpointRejected  = { " ", "DiagnosticError" },
			LogPoint            = ".>",
		}
		vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

		for name, sign in pairs(dapIcon) do
			sign = type(sign) == "table" and sign or { sign }
			vim.fn.sign_define(
				"Dap" .. name,
				{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
			)
		end
	end
}
