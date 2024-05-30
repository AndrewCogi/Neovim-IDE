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

		-- Bwipeout 실시할 때, lsp buffer 연결도 끊도록 설정 (:LspInfo 참고)
		local function buffer_augroup(group, bufnr, cmds)
			vim.api.nvim_create_augroup(group, { clear = false })
			vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
			for _, cmd in ipairs(cmds) do
				local event = cmd.event
				cmd.event = nil
				vim.api.nvim_create_autocmd(event, vim.tbl_extend("keep", { group = group, buffer = bufnr }, cmd))
			end
		end

		local function on_attach(client, bufnr)
			local detach = function()
				vim.lsp.buf_detach_client(bufnr, client.id)
			end
			buffer_augroup("entropitor:lsp:closing", bufnr, {
				{ event = "BufDelete", callback = detach },
			})
		end
		require('lspconfig').jdtls.setup({ on_attach = on_attach })
	end
}
