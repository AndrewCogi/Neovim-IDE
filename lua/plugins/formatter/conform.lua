return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require('conform')
		conform.setup({
			formatters_by_ft = {
				-- 해당 formatter가 동작하기 위해서는 lsp 설치가 되어있어야 함
				java = { "google-java-format" },
				lua = { "stylua" },
				xml = { "xmlformat" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			}
		})
	end
}
