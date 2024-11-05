-- python file에 대해 run 실행하는 함수

local function file_runner_python()
	vim.cmd("split | term python3 " .. vim.fn.expand('%:p'))
	vim.cmd("normal! G")
end

return {
	file_runner_python = file_runner_python
}
