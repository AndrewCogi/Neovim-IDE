-- lsp 관련
return {
	-- mason
	{
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup()
		end
	},
	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { "lua_ls", "jdtls" }
			})
		end
	},
	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup({})
			lspconfig.jdtls.setup({})
		end
	},
}
