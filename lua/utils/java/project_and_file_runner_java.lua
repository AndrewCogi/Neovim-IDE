-- root_dir 판단 및 project tool (maven/gradle)판단 후, run 실행하는 함수

local function project_runner_java()
	local root_dir = require('jdtls.setup').find_root({ 'pom.xml', 'build.gradle' })
	if root_dir ~= nil then
		-- [Check] Is this maven project file?
		if vim.fn.filereadable(root_dir .. "/pom.xml") == 1 then
			local grep_output = vim.fn.system("grep '<artifactId>spring-boot' " .. root_dir .. "/pom.xml")
			local is_spring_boot = string.find(grep_output, "<artifactId>spring%-boot")
			-- [Check] Is this Springboot project?
			if is_spring_boot then
				vim.cmd("split | term cd " .. root_dir .. " && mvn spring-boot:run")
			else
				vim.cmd("split | term cd " .. root_dir .. " && mvn -q compile exec:java")
			end
			vim.cmd("normal! G")
		-- [Check] Is this gradle project file?
		elseif vim.fn.filereadable(root_dir .. "/build.gradle") == 1 then
			local grep_output = vim.fn.system("grep 'org.springframework.boot' " .. root_dir .. "/build.gradle")
			local is_spring_boot = string.find(grep_output, "org.springframework.boot")
			-- [Check] Is this Springboot project?
			if is_spring_boot then
				vim.cmd("split | term cd " .. root_dir .. " && gradle bootRun --console=plain")
			else
				vim.cmd("split | term cd " .. root_dir .. " && gradle run --console=plain -q")
			end
			vim.cmd("normal! G")
		end
	else
		-- [Check] Is this project file?
		vim.cmd("split | term javac " .. vim.fn.expand('%:p') .. " && java " .. vim.fn.expand('%:p'))
	end
end

return {
	project_runner_java = project_runner_java
}
