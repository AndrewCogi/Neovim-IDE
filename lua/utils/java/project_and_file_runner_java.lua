-- root_dir 판단 및 project tool (maven/gradle)판단 후, run 실행하는 함수
-- .env 파일의 경우 루트 디렉토리에 단일 파일로 존재하는 것만 사용 

local function project_and_file_runner_java()
	local root_dir = require('jdtls.setup').find_root({ 'pom.xml', 'build.gradle' })

	if root_dir ~= nil then
		-- [Check] if .env exists in the project root
		local env_path = root_dir .. "/.env"
		local has_env = vim.fn.filereadable(env_path) == 1
		local env_prefix = ""

		if has_env then
			env_prefix = ". " .. env_path .. " && "
		end

		-- [Check] Is this maven project file?
		if vim.fn.filereadable(root_dir .. "/pom.xml") == 1 then
			local grep_output = vim.fn.system("grep '<artifactId>spring-boot' " .. root_dir .. "/pom.xml")
			local is_spring_boot = string.find(grep_output, "<artifactId>spring%-boot")
			-- [Check] Is this Springboot project?
			if is_spring_boot then
				vim.cmd("split | term cd " .. root_dir .. " && " .. env_prefix .. "mvn spring-boot:run")
			else
				vim.cmd("split | term cd " .. root_dir .. " && " .. env_prefix .. "mvn -q compile exec:java")
			end

		-- [Check] Is this gradle project file?
		elseif vim.fn.filereadable(root_dir .. "/build.gradle") == 1 then
			local grep_output = vim.fn.system("grep 'org.springframework.boot' " .. root_dir .. "/build.gradle")
			local is_spring_boot = string.find(grep_output, "org.springframework.boot")
			-- [Check] Is this Springboot project?
			if is_spring_boot then
				vim.cmd("split | term cd " .. root_dir .. " && " .. env_prefix .. "gradle bootRun --console=plain")
			else
				vim.cmd("split | term cd " .. root_dir .. " && " .. env_prefix .. "gradle run --console=plain -q")
			end
		end

		vim.cmd("normal! G")
	else
		-- [Check] Fallback: single Java file
		local java_file = vim.fn.expand('%:p')
		local class_name = vim.fn.expand('%:t:r')
		vim.cmd("split | term javac " .. java_file .. " && java " .. class_name)
	end
end

return {
	project_and_file_runner_java = project_and_file_runner_java
}
