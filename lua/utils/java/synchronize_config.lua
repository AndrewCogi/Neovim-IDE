-- pom.xml 또는 build.gradle 변경사항 project에 적용하는 함수

local Job = require("plenary.job")

local is_running = false
local error_occured = false
local function synchronize_config()
	if is_running then
		vim.notify("[synchronize_config()] is already in progress.", vim.log.levels.WARN)
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
		vim.cmd("silent! rm -r ~/.m2/")
		Job
			:new({
				command = "mvn",
				args = { "clean", "dependency:purge-local-repository", "dependency:resolve", "validate" },
				on_start = function()
					vim.schedule(function()
						vim.notify("Starting [pom.xml] synchronization...")
					end)
				end,
				on_exit = function(j, return_val)
					if return_val == 0 then
						vim.schedule(function()
							vim.notify("[pom.xml] synchronization successful.\nRestarting jdtls...")
							-- jdtls 완전 초기화
							require("java").setup()

							-- Bwipeout 실시할 때, lsp buffer 연결도 끊도록 설정 (:LspInfo 참고)
							local function buffer_augroup(group, bufnr, cmds)
								vim.api.nvim_create_augroup(group, { clear = false })
								vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
								for _, cmd in ipairs(cmds) do
									local event = cmd.event
									cmd.event = nil
									vim.api.nvim_create_autocmd(
										event,
										vim.tbl_extend("keep", { group = group, buffer = bufnr }, cmd)
									)
								end
							end

							local function on_attach(client, bufnr)
								local detach = function()
									vim.lsp.buf_detach_client(bufnr, client.id)
								end
								buffer_augroup("entropitor:lsp:closing", bufnr, {
									{ event = "BufDelete", callback = detach },
								})
							end
							require("lspconfig").jdtls.setup({ on_attach = on_attach })
							is_running = false
						end)
					else
						if not error_occured then
							vim.schedule(function()
								vim.notify(
									"[pom.xml] synchronization failed.\nPlease check your current directory (pwd) or the contents of [pom.xml].\nIf the problem persists, run 'mvn clean dependency:purge-local-repository dependency:resolve validate' manually.",
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
							"[pom.xml] synchronization failed.\nPlease check your current directory (pwd) or the contents of [pom.xml].\nIf the problem persists, run 'mvn clean dependency:purge-local-repository dependency:resolve validate' manually.",
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
		vim.cmd("silent! rm -r ~/.gradle/")
		Job
			:new({
				command = "gradle",
				args = { "clean", "--refresh-dependencies" },
				on_start = function()
					vim.schedule(function()
						vim.notify("Starting [build.gradle] synchronization...")
					end)
				end,
				on_exit = function(j, return_val)
					if return_val == 0 then
						vim.schedule(function()
							vim.notify("[build.gradle] synchronization successful.\nRestarting jdtls...")
							-- jdtls 완전 초기화
							require("java").setup()

							-- Bwipeout 실시할 때, lsp buffer 연결도 끊도록 설정 (:LspInfo 참고)
							local function buffer_augroup(group, bufnr, cmds)
								vim.api.nvim_create_augroup(group, { clear = false })
								vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
								for _, cmd in ipairs(cmds) do
									local event = cmd.event
									cmd.event = nil
									vim.api.nvim_create_autocmd(
										event,
										vim.tbl_extend("keep", { group = group, buffer = bufnr }, cmd)
									)
								end
							end

							local function on_attach(client, bufnr)
								local detach = function()
									vim.lsp.buf_detach_client(bufnr, client.id)
								end
								buffer_augroup("entropitor:lsp:closing", bufnr, {
									{ event = "BufDelete", callback = detach },
								})
							end
							require("lspconfig").jdtls.setup({ on_attach = on_attach })
							is_running = false
						end)
					else
						if not error_occured then
							vim.schedule(function()
								vim.notify(
									"[build.gradle] synchronization failed.\nPlease check your current directory (pwd) or the contents of [build.gradle].\nIf the problem persists, run 'gradle clean --refresh-dependencies' manually.",
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
							"[build.gradle] synchronization failed.\nPlease check your current directory (pwd) or the contents of [build.gradle].\nIf the problem persists, run 'gradle clean --refresh-dependencies' manually.",
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
	synchronize_config = synchronize_config,
}
