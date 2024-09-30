-- mapping setting (plugin)
local mapKey = require("utils.keyMapper").mapKey


-- [Plugin] vim-bbye
-- buffer delete
mapKey("<leader>bd", ":Bdelete<CR>")

-- [Plugin] nvim-osc52
-- visual 모드에서 ctrl+c 클립보드 저장
-- cmd+v로 붙여넣기 (ios)
mapKey("<C-c>", "y", "x")
mapKey("<C-v>", "p")
mapKey("<C-v>", "p", "x")


-- [Plugin] hop.nvim
-- normal 모드에서 단어 찾아 커서 이동
mapKey("<leader>s", require("hop").hint_char2)


-- [Plugin] Comment.nvim
-- normal 모드에서 gcc 로 해당 라인 주석처리
-- visual 모드에서 gc 로 블럭 주석처리


-- [Plugin] luasnip
-- normal 모드에서 snippet 1 칸 앞으로
-- mapKey('<C-m>', function() require('luasnip').jump(1) end)
mapKey("<C-l>", function()
	require("luasnip").jump(1)
end, "i")
mapKey("<C-l>", function()
	require("luasnip").jump(1)
end, "v")
-- normal 모드에서 snippet 1 칸 뒤로
mapKey("<C-h>", function()
	require("luasnip").jump(-1)
end, "i")
mapKey("<C-h>", function()
	require("luasnip").jump(-1)
end, "v")


-- [Plugin] nvim-surround
-- normal 모드에서 ys, ds, cs 사용 가능
-- ys - (you surround)
-- yss? : ?로 그 줄을 감싼다.
-- ysst? : <?>로 그 줄을 감싼다.
-- ysiw? : ?로 그 단어를 감싼다.
-- ysiwt? : ?로 그 단어를 감싼다.
-- ds - (delete surround)
-- ds? : ?를 삭제한다.
-- dst : 가장 가까이 감싸진 html tag를 삭제한다.
-- cs - (change surround)
-- cs?! : ?를 !로 교체한다.
-- cst? : html tag를 ?로 교체한다.

-- visual 모드에서 S 사용 가능
-- S? : visual 모드로 잡은 범위를 ?로 감싼다.
-- St? : visual 모드로 잡은 범위를 <?>로 감싼다.


-- [Plugin] toggleterm.nvim
-- normal 모드에서 터미널 창 띄우기(horizontal)
mapKey("<leader>t", ":ToggleTerm dir=%p direction=horizontal<CR>")
-- normal 모드에서 터미널 창 띄우기(float)
mapKey("<leader>T", ":ToggleTerm dir=%p direction=float<CR>")


-- [Plugin] gitsigns.nvim
-- normal 모드에서 git change 다음 지점으로 이동
mapKey("]g", require("gitsigns").next_hunk)
mapKey("[g", require("gitsigns").prev_hunk)
-- normal 모드에서 git change 등록하기(A:현재파일 전체)
mapKey("gha", require("gitsigns").stage_hunk)
mapKey("ghA", require("gitsigns").stage_buffer)
-- normal 모드에서 git change 취소하기
mapKey("ghu", require("gitsigns").undo_stage_hunk)
-- normal 모드에서 git change 변경사항 폐기 및 원상복귀(U:현재파일 전체)
mapKey("ghr", require("gitsigns").reset_hunk)
mapKey("ghR", require("gitsigns").reset_buffer)
-- normal 모드에서 파일 변경점 확인하기
mapKey("ghd", require("gitsigns").diffthis)
-- normal 모드에서 코드 변경자 확인하기
mapKey("ghb", function()
	require("gitsigns").blame_line({ full = true })
end)


-- [Plugin] neo-tree.nvim
-- normal 모드에서 file explorer 열고 닫기
mapKey("<leader>e", ":Neotree toggle<CR>")


-- [Plugin] telescope
local builtin = require("telescope.builtin")
-- 파일 찾기
mapKey("<leader>ff", builtin.find_files)
-- 코드 내 단어 찾기 (ripgrep 설치 필요)
mapKey("<leader>fg", builtin.live_grep)
-- 탭(버퍼) 찾기
mapKey("<leader>fb", builtin.buffers)
-- 도움말 찾기
mapKey("<leader>fh", builtin.help_tags)


-- [Plugin] nvim-lspconfig
-- normal 모드에서 코드 문법에 대해 hover 하여 설명 보기
mapKey("?", vim.lsp.buf.hover)
-- normal 모드에서 선언부 찾기
mapKey("gd", vim.lsp.buf.definition)
-- normal 모드에서 구현부 찾기
mapKey("gi", vim.lsp.buf.implementation)
-- normal 모드에서 사용처 찾기
mapKey("gr", vim.lsp.buf.references)
-- code action
mapKey("<leader>ac", vim.lsp.buf.code_action)
-- rename
mapKey("<leader>rn", vim.lsp.buf.rename)
-- formatting
mapKey("<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "n")
mapKey("<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "v")
-- lsp restart
mapKey("<leader>lr", ":LspRestart<CR>")


-- [Plugin] nvim-jdtls
-- organize imports
mapKey("<leader>ko", function()
	if vim.bo.filetype == 'java' then
		require("jdtls").organize_imports()
	end
end)
-- update projects config
mapKey("<leader>//", function()
	require("jdtls").update_projects_config()
end)
-- extract variable
mapKey("<leader>xv", function()
	if vim.bo.filetype == 'java' then
		require("jdtls").extract_variable()
	end
end)
-- make test / goto test
mapKey("<leader>gt", function()
	if vim.bo.filetype == 'java' then
		require("jdtls.tests").goto_subjects()
	end
end)
-- run
mapKey("<leader>kr", function()
	-- java file
	if vim.bo.filetype == 'java' then
		vim.cmd("split | term javac " .. vim.fn.expand('%:p') .. " && java " .. vim.fn.expand('%:p'))
	-- python file
	elseif vim.bo.filetype == 'python' then
		vim.cmd("split | term python3 " .. vim.fn.expand('%:p'))
	-- java project
	else
		require("utils.java.project_runner_java").project_runner_java()
	end
end)
-- test current class
mapKey("<leader>kt", function()
	if vim.bo.filetype == 'java' then
		require("utils.java.project_tester_java").project_tester_java(true)
		-- require("jdtls").test_class()
	end
end)
-- test current method
mapKey("<leader>km", function()
	if vim.bo.filetype == 'java' then
		require("utils.java.project_tester_java").project_tester_java(false)
		-- require("jdtls").test_nearest_method()
	end
end)


-- [Plugin] nvim-dap
-- normal 모드에서 dap ui 열고 닫기
mapKey("<leader>du", function()
	require("dapui").toggle({})
end)
-- normal 모드에서 toggle breakpoint
mapKey("<leader>db", function()
	require("dap").toggle_breakpoint()
end)
-- normal 모드에서 toggle breakpoint (with condition 지정)
mapKey("<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
-- normal 모드에서 continue (run debug)
mapKey("<leader>dr", function()
	require("utils.java.project_debugger_java").project_debugger_java()
	-- require("dap").continue()
end)
-- normal 모드에서 go to line (no execute)
mapKey("<leader>dg", function()
	require("dap").goto_()
end)
-- normal 모드에서 step into
mapKey("<leader>di", function()
	require("dap").step_into()
end)
-- normal 모드에서 step over
mapKey("<leader>do", function()
	require("dap").step_over()
end)
-- normal 모드에서 step out
mapKey("<leader>dO", function()
	require("dap").step_out()
end)
-- normal 모드에서 pause
mapKey("<leader>dp", function()
	require("dap").pause()
end)
-- normal 모드에서 session
mapKey("<leader>ds", function()
	require("dap").session()
end)
-- normal 모드에서 terminate
mapKey("<leader>dt", function()
	require("dap").terminate()
end)


-- [Plugin] noice.nvim
-- normal 모드에서 메세지 기록 보기
mapKey("<leader>ms", function()
	require("noice").cmd("all")
end)
-- normal 모드에서 마지막 메세지 보기
mapKey("<leader>ml", function()
	require("noice").cmd("last")
end)
-- normal 모드에서 현재 보여지는 메세지 모두 닫기
mapKey("<leader>md", function()
	require("noice").cmd("dismiss")
end)
