-- base가 아닌 다른 conda 환경이라면(사용자 지정 환경이라면), 해당 conda 환경 맞게 터미널 열기
local function activate_conda_in_terminal()
	local conda_env = vim.env.CONDA_DEFAULT_ENV
	if conda_env ~= nil and conda_env ~= 'base' then
		-- If a Conda environment is active, activate it in the terminal
		vim.fn.chansend(vim.b.terminal_job_id, "conda activate " .. conda_env .. "&& clear\n")
	end
end

return {
	activate_conda_in_terminal = activate_conda_in_terminal
}
