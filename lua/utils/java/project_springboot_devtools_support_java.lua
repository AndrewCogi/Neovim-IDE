-- project tool (maven/gradle)판단 후, 비동기 build 실행하는 함수
-- 그래야 devtools가 잘 동작한다! (maven 은 제대로 동작. gradle만 동작하지 않아서 gradle에 대해서만 작성)

local file_modified = false

-- 파일이 실제로 수정되었는지 확인
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.java",
	callback = function()
		if vim.bo.modified then
			file_modified = true
		else
			file_modified = false
		end
	end
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.java",
	callback = function()
		-- 파일이 실제로 수정되었는지 확인
		if not file_modified then
			return
		end

		local root_dir = require('jdtls.setup').find_root({ 'pom.xml', 'build.gradle' })
		if root_dir ~= nil then
			-- Gradle 프로젝트인지 확인
			if vim.fn.filereadable(root_dir .. "/build.gradle") == 1 then
				-- Check if it's a Spring Boot project
				local grep_output = vim.fn.system("grep 'org.springframework.boot' " .. root_dir .. "/build.gradle")
				local is_spring_boot = string.find(grep_output, "org.springframework.boot")

				-- Check if spring boot project is running
				local boot_process = vim.fn.system("ps aux | grep 'java' | grep 'spring-boot' | grep -v grep")
				local is_running = string.find(boot_process, "spring%-boot")

				-- both correct, re-compile java
				if is_spring_boot and is_running then
					vim.fn.jobstart("cd " .. root_dir .. " && gradle compileJava", { detach = true })
				end
			end
		end
	end,
})
