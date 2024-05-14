-- lazy.nvim plugin manager 자동 설치
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 플러그인 세팅 전 globals, options 설정 먼저 적용
require("config.globals")
require("config.options")

-- 플러그인 세팅
require("lazy").setup({
	spec = {
		-- plugins/ 폴더 내에 있는 기본 플러그인 설치
		{ import = "plugins/clipboard" },
		{ import = "plugins/coding" },
		{ import = "plugins/colorscheme" },
		{ import = "plugins/dap" },
		{ import = "plugins/editor" },
		{ import = "plugins/formatter" },
		{ import = "plugins/lint" },
		{ import = "plugins/lsp" },
		{ import = "plugins/treesitter" },
		{ import = "plugins/ui" },
		-- custom 플러그인 설치
		{ import = "plugins/_custom" },
	},
	-- automatically check for plugin updates
	checker = { enabled = true }
})

-- keymaps 설정 적용
require("config.keymaps")
