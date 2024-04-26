-- floating terminal
return {
	'numToStr/FTerm.nvim',
	config = function()
		require('FTerm').setup({
			border = 'double',
			dimemsions = {
				height = 0.9,
				width = 0.9,
			}
		})
	end
}
