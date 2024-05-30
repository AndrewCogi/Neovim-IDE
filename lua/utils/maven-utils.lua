local Job = require('plenary.job')

-- 함수 정의
local function synchronize_pom()
	vim.notify("Synchronize pom.xml...")
	vim.cmd("silent! rm -r ~/.m2")

	Job:new({
		command = 'mvn',
		args = { 'clean', 'dependency:purge-local-repository', 'dependency:resolve', 'validate' },
		on_start = function()
			-- vim.notify("Executing: mvn clean dependency:purge-local-repository dependency:resolve validate")
		end,
		on_exit = function(j2, return_val2)
			if return_val2 == 0 then
				vim.schedule(function()
					vim.notify("Synchronize pom.xml successfully.\nRestarting jdtls...")
					vim.cmd("LspRestart jdtls")
				end)
			else
				vim.notify("Synchronize pom.xml failed. Check your pwd.", vim.log.levels.ERROR)
			end
		end,
		on_stderr = function(_, data)
			vim.notify(data, vim.log.levels.ERROR)
		end,
	}):start()
end

-- 모듈 반환
return {
	synchronize_pom = synchronize_pom
}
