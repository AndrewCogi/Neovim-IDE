-- 실행되는 폴더 [target (maven)] 또는 [bin (gradle)] 를 최신화하는 함수
-- nvim-java는 gradle의 build 폴더를 사용하지 않고 bin 폴더를 만들어 사용함
-- 따라서 이에 맞춰서 프로그래밍을 진행

local Job = require("plenary.job")

local is_running = false
local error_occured = false
local function synchronize_exec_dir_and_run(debug)
	if is_running then
		vim.notify("[synchronize_exec_dir()] is already in progress.", vim.log.levels.WARN)
		return
	end

	is_running = true
	error_occured = false

	local maven_file = "pom.xml"
	local gradle_file = "build.gradle"

	local function file_exists(file)
		local stat = vim.loop.fs_stat(file)
		return (stat and stat.type) or false
	end

	-- [[ maven ]]
	if file_exists(maven_file) then
		Job
			:new({
				command = "mvn",
				args = { "clean", "compile", "process-resources", "process-classes" },
				on_start = function()
					vim.schedule(function()
						vim.notify("Starting [target directory] synchronization...")
					end)
				end,
				on_exit = function(j, return_val)
					if return_val == 0 then
						vim.schedule(function()
							vim.notify("[target directory] synchronization successful.\nExecuting project (run)...")
							if debug then
								require("dap").continue()
							else
								require("java").runner.built_in.run_app({})
							end
							is_running = false
						end)
					else
						if not error_occured then
							vim.schedule(function()
								vim.notify(
									"[target directory] synchronization failed.\nPlease check your compilation errors.\nIf the problem persists, run 'mvn clean compile process-resources process-classes' manually.",
									vim.log.levels.ERROR
								)
								is_running = false
								error_occured = true
							end)
						end
					end
				end,
				on_stderr = function(_, data)
					if not error_occured then
						vim.notify(
							"[target directory] synchronization failed.\nPlease check your compilation errors.\nIf the problem persists, run 'mvn clean compile process-resources process-classes' manually.",
							vim.log.levels.ERROR
						)
						is_running = false
						error_occured = true
					end
				end,
			})
			:start()

		-- [[ gradle ]]
	elseif file_exists(gradle_file) then
		Job
			:new({
				command = "gradle",
				args = { "clean", "compileJava", "processResources", "classes" },
				on_start = function()
					vim.schedule(function()
						vim.notify("Starting [bin directory] synchronization...")
					end)
				end,
				on_exit = function(j, return_val)
					if return_val == 0 then
						vim.schedule(function()
							Job
								:new({
									command = "sh",
									args = {
										"-c",
										-- [1] : bin directory 삭제
										"rm -rf bin && " ..
										-- [2] : main contents 생성
										"mkdir -p bin/main && " ..
										"cp -r build/classes/java/main/* bin/main/ && " ..
										"cp -r build/resources/main/* bin/main/"
									},
									on_start = function() end,
									on_exit = function(j2, return_val2)
										if return_val2 == 0 then
											vim.schedule(function()
												vim.notify(
													"[bin directory] synchronization successful.\nExecuting project (run)..."
												)
												if debug then
													require("dap").continue()
												else
													require("java").runner.built_in.run_app({})
												end
												is_running = false
											end)
										else
											if not error_occured then
												vim.schedule(function()
													vim.notify(
														"[bin directory] synchronization failed.\nPlease check your compilation errors.\nIf the problem persists, run 'gradle clean compileJava processResources classes' manually.",
														vim.log.levels.ERROR
													)
													is_running = false
													error_occured = true
												end)
											end
										end
									end,
									on_stderr = function(_, data)
										if not error_occured then
											vim.notify("", vim.log.levels.ERROR)
											is_running = false
											error_occured = true
										end
									end,
								})
								:start()
						end)
					else
						if not error_occured then
							vim.schedule(function()
								vim.notify(
									"[bin directory] synchronization failed.\nPlease check your compilation errors.\nIf the problem persists, run 'gradle clean compileJava processResources classes' manually.",
									vim.log.levels.ERROR
								)
								is_running = false
								error_occured = true
							end)
						end
					end
				end,
				on_stderr = function(_, data)
					if not error_occured then
						vim.notify(
							"[bin directory] synchronization failed.\nPlease check your compilation errors.\nIf the problem persists, run 'gradle clean compileJava processResources classes' manually.",
							vim.log.levels.ERROR
						)
						is_running = false
						error_occured = true
					end
				end,
			})
			:start()

		-- [[ nothing ]]
	else
		vim.notify("No [pom.xml] or [build.gradle] found in the current directory.", vim.log.levels.ERROR)
		is_running = false
		error_occured = false
	end
end

return {
	synchronize_exec_dir_and_run = synchronize_exec_dir_and_run,
}
