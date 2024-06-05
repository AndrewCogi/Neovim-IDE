-- for [mason & nvim] lspconfig
return {
	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require('mason-lspconfig').setup({
				-- lua, xml, gradle
				ensure_installed = { "lua_ls", "lemminx", "gradle_ls" }
			})
		end
	},
	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
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

			-- lua
			lspconfig.lua_ls.setup({ on_attach = on_attach })
			-- xml
			lspconfig.lemminx.setup({ on_attach = on_attach })
			-- gradle
			lspconfig.gradle_ls.setup({ on_attach = on_attach })
		end
	},
}
