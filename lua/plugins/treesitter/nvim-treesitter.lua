-- 언어별 하이라이팅, 들여쓰기 등 편의성 지원
-- :TSModuleInfo 명령을 통해 지원되는 언어팩 확인 가능
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			-- 필요한 언어 작성 (lsp directory에 추가된 언어 맞추어 설치)
			ensure_installed = { "lua", "java" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
