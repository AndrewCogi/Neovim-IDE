return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require('conform')
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				java = { "google-java-format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			}
		})
	end
}
