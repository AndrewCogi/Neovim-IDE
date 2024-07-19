-- root_dir 판단 및 project tool (maven/gradle) 판단 후, test 실행하는 함수

local Job = require("plenary.job")

local is_running = false
local error_occured = false

local function project_tester_java(is_class)
	-- check is_running variable
	if is_running == true then
		vim.notify("[project_tester_java] already in progress.", vim.log.levels.WARN)
		return
	end

	-- initialize status
	is_running = true
	error_occured = false

	-- check maven / gradle
	local root_dir = require('jdtls.setup').find_root({ 'pom.xml', 'build.gradle' })
	if root_dir ~= nil then
		if vim.fn.filereadable(root_dir .. "/pom.xml") == 1 then
			-- prepare test sources
			Job:new({
				command = "sh",
				args = {
					"-c",
					"cd " .. root_dir .. " && " ..
					"mvn clean test-compile process-test-resources process-test-classes"
				},
				on_start = function()
					vim.schedule(function()
						vim.notify("[project_tester_java] Preparing test sources...")
					end)
				end,
				on_exit = function(j, return_val)
					if return_val == 0 then
						vim.schedule(function()
							vim.notify("[project_tester_java] Preparation Complete.\nExecuting test...")
							if is_class then
								require("jdtls").test_class()
							else
								require("jdtls").test_nearest_method()
							end
							is_running = false
						end)
					else
						if not error_occured then
							vim.schedule(function()
								vim.notify(
									"[project_tester_java] Preparation Failed.\nIf the problem persists, run 'mvn clean test-compile process-test-resources process-test-classes' manually.",
									vim.log.levels.ERROR)
								is_running = false
								error_occured = true
							end)
						end
					end
				end,
				on_stderr = function(_, data)
					if not error_occured then
						vim.schedule(function()
							vim.notify(
								"[project_tester_java] Preparation Failed.\nIf the problem persists, run 'mvn clean test-compile process-test-resources process-test-classes' manually.",
								vim.log.levels.ERROR)
							is_running = false
							error_occured = true
						end)
					end
				end,
			}):start()
		elseif vim.fn.filereadable(root_dir .. "/build.gradle") == 1 then
			-- prepare test sources
			Job:new({
				command = "sh",
				args = {
					"-c",
					"cd " .. root_dir .. " && " ..
					"gradle clean compileTestJava processTestResources testClasses"
				},
				on_start = function()
					vim.schedule(function()
						vim.notify("[project_tester_java] Preparing test sources...")
					end)
				end,
				on_exit = function(j, return_val)
					if return_val == 0 then
						vim.schedule(function()
							Job:new({
								command = "sh",
								args = {
									"-c",
									-- [0] : root_dir 이동
									"cd " .. root_dir .. " && " ..
									-- [1] : bin directory 생성
									"mkdir -p bin && " ..
									-- [2] : main contents 생성(test에 필요)
									"mkdir -p bin/main && " ..
									"cp -r build/classes/java/main/* bin/main/ && " ..
									"cp -r build/resources/main/* bin/main/ && " ..
									-- [3] : test contents 생성
									"mkdir -p bin/test && " ..
									"cp -r build/classes/java/test/* bin/test/ && " ..
									"cp -r build/resources/test/* bin/main/ 2>/dev/null || true"
								},
								on_start = function() end,
								on_exit = function(j2, return_val2)
									if return_val2 == 0 then
										vim.schedule(function()
											vim.notify("[project_tester_java] Preparation Complete.\nExecuting test...")
											if is_class then
												require("jdtls").test_class()
											else
												require("jdtls").test_nearest_method()
											end
											is_running = false
										end)
									else
										if not error_occured then
											vim.schedule(function()
												vim.notify("[project_tester_java] Error while 'sh' command.", vim.log.levels.ERROR)
												is_running = false
												error_occured = true
											end)
										end
									end
								end,
								on_stderr = function(_, data)
									if not error_occured then
										vim.notify("[project_tester_java] Error while 'sh' command.", vim.log.levels.ERROR)
										is_running = false
										error_occured = true
									end
								end,
							}):start()
						end)
					else
						if not error_occured then
							vim.schedule(function()
								vim.notify(
									"[project_tester_java] Preparation Failed.\nIf the problem persists, run 'gradle clean compileTestJava processTestResources testClasses' manually.",
									vim.log.levels.ERROR)
								is_running = false
								error_occured = true
							end)
						end
					end
				end,
				on_stderr = function(_, data)
					if not error_occured then
						vim.schedule(function()
							vim.notify(
								"[project_tester_java] Preparation Failed.\nIf the problem persists, run 'gradle clean compileTestJava processTestResources testClasses' manually.",
								vim.log.levels.ERROR)
							is_running = false
							error_occured = true
						end)
					end
				end,
			}):start()
		else
			is_running = false
			error_occured = false
		end
	else
		is_running = false
		error_occured = false
	end
end

return {
	project_tester_java = project_tester_java
}
