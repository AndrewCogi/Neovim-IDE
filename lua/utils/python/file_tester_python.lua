-- python file에 대해 test 실행하는 함수
local function file_tester_python()
		require("dap-python").test_method()
end

return {
	file_tester_python = file_tester_python
}
