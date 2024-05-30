-- for java
return {
	"nvim-java/nvim-java",
	dependencies = {
		"nvim-java/lua-async-await",
		"nvim-java/nvim-java-core",
		"nvim-java/nvim-java-test",
		"nvim-java/nvim-java-dap",
		"nvim-java/nvim-java-refactor",
		"MunifTanjim/nui.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		{
			"williamboman/mason.nvim",
			opts = {
				registries = {
					"github:nvim-java/mason-registry",
					"github:mason-org/mason-registry",
				},
			},
		},
		-- for java code action
		{
			'AndrewCogi/jc.nvim',
			'mfussenegger/nvim-jdtls',
			config = function()
				require('jc').setup()
			end
		}
	},
	config = function()
		require('java').setup()
		require('lspconfig').jdtls.setup({})
	end
}
