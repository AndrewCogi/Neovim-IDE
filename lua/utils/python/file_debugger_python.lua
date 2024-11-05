-- root_dir 판단 및 project tool (maven/gradle) 판단 후, debug 실행하는 함수

local function file_debugger_python()
	require("dap").continue()
end

return {
	file_debugger_python = file_debugger_python
}
