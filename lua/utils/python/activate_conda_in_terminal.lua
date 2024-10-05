-- conda 환경 사용 시, 사용중인 환경으로 설정
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		if vim.api.nvim_get_vvar("should_check_conda") == true then
			local conda_env = vim.env.CONDA_DEFAULT_ENV
			if conda_env ~= nil and conda_env ~= 'base' then
				-- Conda 환경 활성화 및 clear
				vim.fn.chansend(vim.b.terminal_job_id, "conda activate " .. conda_env .. " && clear\n")
			end
			vim.api.nvim_set_vvar("should_check_conda", false) -- 플래그 리셋
		end
	end
})
