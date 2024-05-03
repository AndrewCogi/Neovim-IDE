-- terminal in neovim
return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			border = 'double',
			dimensions = {
				height = 0.9,
				weight = 0.9,
			}
		})
	end
}
