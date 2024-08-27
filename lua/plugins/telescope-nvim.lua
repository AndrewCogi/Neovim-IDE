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
			},
			-- 특정 파일 보이지 않도록
			file_ignore_patterns = {
				".git/",
				".cache",
				"%.o",
				"%.a",
				"%.out",
				"%.class",
				"%.pdf",
				"%.mkv",
				"%.mp4",
				"%.zip"
			}
		}
	}
}
