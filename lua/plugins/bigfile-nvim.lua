-- Improve performance of editing big files
return {
	"LunarVim/bigfile.nvim",
	event = "BufReadPre",
	opts = {
		filesize = 2, -- MiB
	},
	config = function(_, opts)
		require("bigfile").setup(opts)
	end
}
