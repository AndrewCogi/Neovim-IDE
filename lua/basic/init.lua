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

-- basic 설정 적용
require("basic.globals")
require("basic.options")
require("basic.keymaps")

-- 플러그인 세팅
require("lazy").setup("plugins", {
	change_detection = {
		enabled = true, -- automatically check for config file changes and reload the ui
		notify = false, -- turn off notifications whenever plugin changes are made
	}
})

-- plugin keymaps 설정 적용
require("plugins.keymaps.keymaps")

-- project_springboot_devtools_support_java 설정 적용
require("utils.java.project_springboot_devtools_support_java")
