-- Create group to assign commands
-- "clear = true" must be set to prevent loading an
-- auto-command repeatedly every time a file is resourced
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

-- 파일 수정 여부 설정
local was_modified = false

-- 파일이 저장되기 전에 현재 상태 기록
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.xml",
	callback = function()
		was_modified = vim.bo.modified
	end,
	group = autocmd_group,
})

-- 파일 변경 확인 및 저장 시, Refresh 자동 진행
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.xml" },
	desc = "The XML file has been modified. Trying to refresh the maven project...",
	callback = function()
		if was_modified then
			vim.notify("The XML file has been modified. Trying to refresh the maven project...", vim.log.levels.INFO,
				{ title = "maven" })
			require("jdtls.setup").wipe_data_and_restart()
			require("java").setup()
		end
	end,
	group = autocmd_group,
})
