-- for lua
return {
	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { "lua_ls" }
			})
		end
	},
	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup({})
		end
	},
}
