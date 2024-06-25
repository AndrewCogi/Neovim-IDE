-- Auto-completion / Snippets
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet engine & aussociated nvim-cmp source
		"L3MON4D3/LuaSnip",
		'saadparwaiz1/cmp_luasnip',

		-- LSP completion capabilities
		'hrsh7th/cmp-nvim-lsp',

		-- Additional user-frendly snippets
		'rafamadriz/friendly-snippets',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
	},
	config = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
			}),
			sources = cmp.config.sources({
				{ name = "luasnip",  priority = 1, max_item_count = 3 },
				{ name = "nvim_lsp", priority = 2, max_item_count = 5 },
				{ name = "path",     priority = 3, max_item_count = 3 },
			}, {
				{ name = "buffer", priority = 4 },
			}),
			formatting = {
				format = function(_, item)
					local icons = {
						Array         = " ",
						Boolean       = "󰨙 ",
						Class         = " ",
						Codeium       = "󰘦 ",
						Color         = " ",
						Control       = " ",
						Collapsed     = " ",
						Constant      = "󰏿 ",
						Constructor   = " ",
						Copilot       = " ",
						Enum          = " ",
						EnumMember    = " ",
						Event         = " ",
						Field         = " ",
						File          = " ",
						Folder        = " ",
						Function      = "󰊕 ",
						Interface     = " ",
						Key           = " ",
						Keyword       = " ",
						Method        = "󰊕 ",
						Module        = " ",
						Namespace     = "󰦮 ",
						Null          = " ",
						Number        = "󰎠 ",
						Object        = " ",
						Operator      = " ",
						Package       = " ",
						Property      = " ",
						Reference     = " ",
						Snippet       = " ",
						String        = " ",
						Struct        = "󰆼 ",
						TabNine       = "󰏚 ",
						Text          = " ",
						TypeParameter = " ",
						Unit          = " ",
						Value         = " ",
						Variable      = "󰀫 ",
					}
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
					end
					return item
				end,
			},
			experimental = {
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},
			sorting = defaults.sorting,
		})
	end
}
