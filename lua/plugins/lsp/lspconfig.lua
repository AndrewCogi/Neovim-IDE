-- for [mason & nvim] lspconfig
return {
	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require('mason-lspconfig').setup({
				-- java, lua, xml
				ensure_installed = { "jdtls", "lua_ls", "lemminx" }
			})
		end
	},
	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			-- java
			lspconfig.jdtls.setup({})
			-- lua
			lspconfig.lua_ls.setup({})
			-- xml
			lspconfig.lemminx.setup({})
		end
	},
}
