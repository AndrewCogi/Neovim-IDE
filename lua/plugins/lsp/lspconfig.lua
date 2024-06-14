-- for [mason & nvim] lspconfig
return {
	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- lua, xml, gradle, html, yaml(yml)
				ensure_installed = { "lua_ls", "lemminx", "gradle_ls", "html", "yamlls" },
			})
		end,
	},
	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
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
			-- html
			lspconfig.html.setup({ on_attach = on_attach })
			-- yaml(yml)
			lspconfig.yamlls.setup({
				on_attach = on_attach,
				settings = {
					yaml = {
						schemas = {
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
							["https://json.schemastore.org/github-action.json"] = "/.github/action.{yml,yaml}",
							["https://json.schemastore.org/ansible-stable-2.9.json"] = "/playbooks/**/*.yml",
							["http://json.schemastore.org/composer"] = "/composer.json",
							["http://json.schemastore.org/ansible"] = "/roles/**/*.yml",
							["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
							["http://json.schemastore.org/kubeval"] = "helmfile.yaml",
							["https://json.schemastore.org/chart"] = "/Chart.yaml",
							["https://json.schemastore.org/k8sschemas"] = "k8s",
							["https://json.schemastore.org/prometheus-rule"] = "/prometheus/*.yml"
						},
						validate = true,
						completion = true,
						format = {
							enable = true,
						}
					}
				}
			})
		end,
	},
}
