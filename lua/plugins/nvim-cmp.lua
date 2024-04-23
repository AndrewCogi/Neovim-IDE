-- code auto completion
return {
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- load snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
					['<C-j>'] = cmp.mapping(function (fallback)
					if cmp.visible() then
							cmp.scroll_docs(4)
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<C-k>'] = cmp.mapping(function (fallback)
					if cmp.visible() then
							cmp.scroll_docs(-4)
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { 'i', 's' }),
				}),
				-- autocompletion sources
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- lsp
					{ name = "buffer", max_item_count = 5 }, -- next within current buffer
					{ name = "path", max_item_count = 3 }, -- file system paths
					{ name = "luasnip", max_item_count = 3 } -- snippets
				}),
			})
		end,
	}
}
