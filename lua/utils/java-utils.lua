-- java 관련 utils

-- import library
local Job = require('plenary.job')

-- Synchronize function
local function synchronize_project()
	local maven_file = "pom.xml"
	local gradle_file = "build.gradle"

	local function file_exists(file)
		local stat = vim.loop.fs_stat(file)
		return (stat and stat.type) or false
	end

	if file_exists(maven_file) then
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

						-- :LspRestart 대신 완전 초기화 사용
						require('java').setup()

						-- Bwipeout 실시할 때, lsp buffer 연결도 끊도록 설정 (:LspInfo 참고)
						local function buffer_augroup(group, bufnr, cmds)
							vim.api.nvim_create_augroup(group, { clear = false })
							vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
							for _, cmd in ipairs(cmds) do
								local event = cmd.event
								cmd.event = nil
								vim.api.nvim_create_autocmd(event,
									vim.tbl_extend("keep", { group = group, buffer = bufnr }, cmd))
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
						require('lspconfig').jdtls.setup({ on_attach = on_attach })
						-- vim.cmd("LspRestart jdtls")
					end)
				else
					vim.notify("Synchronize pom.xml failed. Check your pwd.", vim.log.levels.ERROR)
				end
			end,
			on_stderr = function(_, data)
				vim.notify(data, vim.log.levels.ERROR)
			end,
		}):start()
	elseif file_exists(gradle_file) then
		vim.notify("Synchronize build.gradle...")
		vim.cmd("silent! rm -r ~/.gradle")

		Job:new({
			command = 'gradle',
			args = { 'clean', '--refresh-dependencies' },
			on_start = function()
				-- vim.notify("Executing: gradle clean build")
			end,
			on_exit = function(j2, return_val2)
				if return_val2 == 0 then
					vim.schedule(function()
						vim.notify("Synchronize build.gradle successfully.\nRestarting jdtls...")

						-- :LspRestart 대신 완전 초기화 사용
						require('java').setup()

						-- Bwipeout 실시할 때, lsp buffer 연결도 끊도록 설정 (:LspInfo 참고)
						local function buffer_augroup(group, bufnr, cmds)
							vim.api.nvim_create_augroup(group, { clear = false })
							vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
							for _, cmd in ipairs(cmds) do
								local event = cmd.event
								cmd.event = nil
								vim.api.nvim_create_autocmd(event,
									vim.tbl_extend("keep", { group = group, buffer = bufnr }, cmd))
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
						require('lspconfig').jdtls.setup({ on_attach = on_attach })
						-- vim.cmd("LspRestart jdtls")
					end)
				else
					vim.notify("Synchronize build.gradle failed. Check your pwd.", vim.log.levels.ERROR)
				end
			end,
			on_stderr = function(_, data)
				vim.notify(data, vim.log.levels.ERROR)
			end,
		}):start()
	else
		vim.notify("No pom.xml or build.gradle found in the current directory.", vim.log.levels.ERROR)
	end
end

return {
	synchronize_project = synchronize_project
}
