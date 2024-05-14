-- Automatically add closing tags for HTML and JSX
return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({})
	end
}
