-- LSP Support
return {
	-- LSP Configuration
	'neovim/nvim-lspconfig',
	event = 'VeryLazy',
	dependencies = {
		-- LSP Management
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },

		-- Auto-Install LSPs, linters, formatters, debuggers
		{ 'WhoIsSethDaniel/mason-tool-installer.nvim' },

		-- Useful status updates for LSP
		{ 'j-hui/fidget.nvim',                        opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		{ 'folke/neodev.nvim' },
	},
	config = function()
	    local arch = vim.loop.os_uname().machine

		-- platform independent LSP list
		local lsp_install_list = {
			'lua_ls', 		-- lua
			'jdtls',		-- java
			'gradle_ls',	-- gradle
			'yamlls', 		-- yaml,yml (require npm)
			'cssls', 		-- css (require npm)
			'html', 		-- html (require npm)
			'ts_ls',		-- js (require npm)
			'jsonls',		-- json (require npm)
			'pyright',		-- python
		}

		-- platform dependent LSP list
		if arch ~= 'aarch64' then
			table.insert(lsp_install_list, 'lemminx') -- xml
		end

		require('mason').setup()
		require('mason-lspconfig').setup({
			-- Install these LSPs automatically
			ensure_installed = lsp_install_list
		})

		require('mason-tool-installer').setup({
			-- Install these linters, formatters, debuggers automatically
			ensure_installed = {
				-- Debugger (java, python)
				'java-debug-adapter',
				'java-test',
				'debugpy',
			},
		})

		-- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
		vim.api.nvim_command('MasonToolsInstall')

		local lspconfig = require('lspconfig')
		local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
		local lsp_attach = function(client, bufnr)
			-- Create your keybindings here...
		end

		-- Call setup on each LSP server
		require('mason-lspconfig').setup_handlers({
			function(server_name)
				-- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
				if server_name ~= 'jdtls' then
					lspconfig[server_name].setup({
						on_attach = lsp_attach,
						capabilities = lsp_capabilities,
					})
				end
			end
		})

		-- Lua LSP settings
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { 'vim' },
					},
				},
			},
		}

		-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
		local open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded" -- Set border to rounded
			return open_floating_preview(contents, syntax, opts, ...)
		end
	end
}
