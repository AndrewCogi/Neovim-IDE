-- Automatically add closing tags for HTML and JSX
return {
	"windwp/nvim-ts-autotag",
	config = function()
		require('nvim-ts-autotag').setup({
			filetypes = { "html", "xml" }
		})
		require 'nvim-treesitter.configs'.setup {
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
				filetypes = { "html", "xml" }
			}
		}
	end
}
