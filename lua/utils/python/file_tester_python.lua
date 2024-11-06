-- python file에 대해 test 실행하는 함수
local function file_tester_python(is_class)
	if is_class then
		require("dap-python").test_class()
	else
		require("dap-python").test_method()
	end
end

return {
	file_tester_python = file_tester_python
}
