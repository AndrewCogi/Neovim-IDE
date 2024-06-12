-- java diagnostics 내용 한 번에 수집하여 최신화하는 함수

local function file_exists(name)
	local f = io.open(name, "r")
	if f then
		f:close()
	end
	return f ~= nil
end

local function get_all_java_files(root)
	local handle = io.popen('find "' .. root .. '" -type f -name "*.java"')
	local result = handle:read("*a")
	handle:close()
	local files = {}
	for file in result:gmatch("[^\r\n]+") do
		table.insert(files, file)
	end
	return files
end

local function collect_diagnostics(root, callback)
	local files = get_all_java_files(root)
	local diagnostics = {}
	local pending = #files

	local function on_diagnostics_received(bufnr)
		local file_diagnostics = vim.diagnostic.get(bufnr)
		for _, diag in ipairs(file_diagnostics) do
			diag.bufnr = bufnr
			table.insert(diagnostics, diag)
		end
		pending = pending - 1
		if pending == 0 then
			callback(diagnostics)
		end
	end

	for _, file in ipairs(files) do
		local bufnr = vim.fn.bufadd(file)
		vim.fn.bufload(bufnr)
		on_diagnostics_received(bufnr)
	end
end

local function set_diagnostics_in_qflist(diagnostics)
	local qflist = {}
	for _, diag in ipairs(diagnostics) do
		table.insert(qflist, {
			bufnr = diag.bufnr,
			lnum = diag.lnum + 1,
			col = diag.col + 1,
			text = diag.message,
			type = vim.diagnostic.severity[diag.severity],
		})
	end
	vim.fn.setqflist(qflist)
end

local function is_jdtls_running()
	for _, client in pairs(vim.lsp.get_active_clients()) do
		if client.name == "jdtls" then
			return true
		end
	end
	return false
end

local function synchronize_diagnostics_java()
	local root = vim.fn.getcwd()
	if not (file_exists(root .. "/pom.xml") or file_exists(root .. "/build.gradle")) then
		vim.notify("No [pom.xml] or [build.gradle] file found in the current directory.", vim.log.levels.ERROR)
		return
	end

	if not is_jdtls_running() then
		vim.notify("[jdtls] is not running. Please start it and try again.", vim.log.levels.ERROR)
		return
	end

	collect_diagnostics(root, function(diagnostics)
		set_diagnostics_in_qflist(diagnostics)
		vim.notify("Diagnostic synchronization complete.\nPlease check the diagnostic results in Neotree.")
	end)
end

return {
	synchronize_diagnostics_java = synchronize_diagnostics_java,
}
