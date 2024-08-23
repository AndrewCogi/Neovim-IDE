-- root_dir 판단 및 project tool (maven/gradle)판단 후, run 실행하는 함수

local function project_runner_java()
	local root_dir = require('jdtls.setup').find_root({ 'pom.xml', 'build.gradle' })
	if root_dir ~= nil then
		if vim.fn.filereadable(root_dir .. "/pom.xml") == 1 then
			-- Check if it's a Spring Boot project
			local grep_output = vim.fn.system("grep '<artifactId>spring-boot' " .. root_dir .. "/pom.xml")
			local is_spring_boot = string.find(grep_output, "<artifactId>spring-boot")
			if is_spring_boot then
				vim.cmd("split | term cd " .. root_dir .. " && mvn spring-boot:run")
			else
				vim.cmd("split | term cd " .. root_dir .. " && mvn compile exec:java")
			end
			vim.cmd("normal! G")
		elseif vim.fn.filereadable(root_dir .. "/build.gradle") == 1 then
			-- Check if it's a Spring Boot project
			local grep_output = vim.fn.system("grep 'org.springframework.boot' " .. root_dir .. "/build.gradle")
			local is_spring_boot = string.find(grep_output, "org.springframework.boot")
			if is_spring_boot then
				vim.cmd("split | term cd " .. root_dir .. " && gradle bootRun --console=plain")
			else
				vim.cmd("split | term cd " .. root_dir .. " && gradle run --console=plain")
			end
			vim.cmd("normal! G")
		end
	end
end

return {
	project_runner_java = project_runner_java
}
