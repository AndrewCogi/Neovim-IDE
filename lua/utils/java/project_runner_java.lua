-- root_dir 판단 및 project tool 판단 후, 실행하는 함수

local function project_runner_java()
	local root_dir = require('jdtls.setup').find_root({ 'pom.xml', 'build.gradle' })
	if root_dir ~= nil then
		if vim.fn.filereadable(root_dir .. "/pom.xml") == 1 then
			vim.cmd("split | term cd " .. root_dir .. "&& mvn spring-boot:run")
			vim.cmd("normal! G")
		elseif vim.fn.filereadable(root_dir .. "/build.gradle") == 1 then
			vim.cmd("split | term cd " .. root_dir .. "&& gradle bootRun --console=plain")
			vim.cmd("normal! G")
		end
	end
end

return {
	project_runner_java = project_runner_java
}
