-- file explorer
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require('neo-tree').setup({
			source_selector = {
				winbar = true,
				sources = {
					{ source = "filesystem" },
					{ source = "buffers" },
					{ source = "git_status" },
					{ source = "document_symbols" },
				}
			},
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols",
			},
			buffers = {
				bind_to_cwd = false,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				}
			}
		})
	end
}
