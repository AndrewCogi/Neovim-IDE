-- auto completion with snippet
return {
	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		-- Not all LSP servers add brackets when completing a function.
		-- To better deal with this, LazyVim adds a custom option to cmp,
		-- that you can configure. For example:
		--
		-- ```lua
		-- opts = {
		--   auto_brackets = { "python" }
		-- }
		-- ```

		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			return {
				auto_brackets = {}, -- configure any filetype to auto add brackets
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					["<C-n>"] = cmp.mapping.scroll_docs(-4),
					["<C-p>"] = cmp.mapping.scroll_docs(4),
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
					{ name = "nvim_lsp" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
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
			}
		end,
		---@param opts cmp.ConfigSchema | {auto_brackets?: string[]}
		config = function(_, opts)
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end
			local cmp = require("cmp")
			local Kind = cmp.lsp.CompletionItemKind
			cmp.setup(opts)
			cmp.event:on("confirm_done", function(event)
				if not vim.tbl_contains(opts.auto_brackets or {}, vim.bo.filetype) then
					return
				end
				local entry = event.entry
				local item = entry:get_completion_item()
				if vim.tbl_contains({ Kind.Function, Kind.Method }, item.kind) then
					local keys = vim.api.nvim_replace_termcodes("()<left>", false, false, true)
					vim.api.nvim_feedkeys(keys, "i", true)
				end
			end)
		end,
	},
	-- LuaSnip
	{
		"L3MON4D3/LuaSnip",
		build = (not vim.uv.os_uname().sysname:find("Windows") ~= nil)
		and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
		or nil,
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			{
				"nvim-cmp",
				dependencies = {
					"saadparwaiz1/cmp_luasnip",
				},
				opts = function(_, opts)
					opts.snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					}
					table.insert(opts.sources, { name = "luasnip" })
				end,
			},
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		-- stylua: ignore
	}
}
