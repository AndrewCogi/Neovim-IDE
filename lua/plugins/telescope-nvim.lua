-- telescope with fzf
return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	tag = "0.1.6",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
			--[[ config = function()
				require("telescope").load_extension("fzf")
			end ]]
		}
	},
	opts = {
		defaults = {
			layout_config = {
				vertical = {
					width = 0.75
				}
			},
			path_display = {
				filename_first = {
					reverse_directories = true
				}
			}
		}
	}
}
