-- mapping setting
local mapKey = require("utils.keyMapper").mapKey


-- normal 모드에서 Tab 누르면 다음 탭으로 이동
mapKey('<TAB>', ':bnext<CR>')
-- normal 모드에서 Shift-Tab 누르면 이전 탭으로 이동
mapKey('<S-TAB>', ':bprevious<CR>')


-- normal 모드에서 탭 삭제, 다음/이전 탭으로 이동
mapKey('<leader>bn', ':bnext<CR>')
mapKey('<leader>bp', ':bprevious<CR>')
-- [Plugin] vim-bbye : explorer 유지하며 버퍼 닫기
mapKey('<leader>bd', ':Bdelete<CR>')


-- visual 모드에서 해당 라인 상/하 이동
mapKey('K', ":move '<-2<CR>gv-gv", 'x')
mapKey('J', ":move '>+1<CR>gv-gv", 'x')


-- normal 모드에서 ctrl+s 저장하기로 동작
mapKey('<C-s>', ':w<CR>')
-- normal 모드에서 ctrl+q 저장+나가기로 동작
mapKey('<C-q>', ':wq<CR>')


-- normal 모드에서 분할 창 이동
mapKey('<C-h>', '<C-w>h')
mapKey('<C-j>', '<C-w>j')
mapKey('<C-k>', '<C-w>k')
mapKey('<C-l>', '<C-w>l')


-- normal 모드에서 창 크기 조절
mapKey('<C-Up>', ':resize -1<CR>')
mapKey('<C-Down>', ':resize +1<CR>')
mapKey('<C-Left>', ':vertical resize -2<CR>')
mapKey('<C-Right>', ':vertical resize +2<CR>')


-- visual 모드에서 >> << 실행 후에도 visual block 유지
mapKey('<', '<gv', 'v')
mapKey('>', '>gv', 'v')


-- normal 모드에서 search highlight 삭제
mapKey('<leader>h', ':nohlsearch<CR>')


-- diagnostic 찾기
mapKey(']c', vim.diagnostic.goto_next)
mapKey('[c', vim.diagnostic.goto_prev)


-- [Plugin] nvim-osc52
-- visual 모드에서 ctrl+c 클립보드 저장
-- cmd+v로 붙여넣기 (ios)
mapKey('<C-c>', 'y', 'x')
mapKey('<C-v>', 'p')
mapKey('<C-v>', 'p', 'x')


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


-- [Plugin] kommentary
-- normal 모드에서 ctrl+/ 로 주석처리, visual 모드에서 ctrl+/ 로 주석처리
mapKey('<C-_>', '<Plug>kommentary_line_default')
mapKey('<C-_>', '<Plug>kommentary_visual_default', 'x')


-- [Plugin] noice
-- normal 모드에서 메세지 기록 보기
mapKey('<leader>ms', function() require("noice").cmd("all") end)
-- normal 모드에서 마지막 메세지 보기
mapKey('<leader>ml', function() require("noice").cmd("last") end)
-- normal 모드에서 현재 보여지는 메세지 모두 닫기
mapKey('<leader>md', function() require("noice").cmd("dismiss") end)


-- [Plugin] neo-tree
-- normal 모드에서 file explorer 열고 닫기
mapKey('<leader>e', ':Neotree toggle<CR>')


-- [Plugin] telescope
local builtin = require("telescope.builtin")
-- 파일 찾기
mapKey('<leader>ff', builtin.find_files)
-- 코드 내 단어 찾기 (ripgrep 설치 필요)
mapKey('<leader>fg', builtin.live_grep)
-- 탭(버퍼) 찾기
mapKey('<leader>fb', builtin.buffers)
-- 도움말 찾기
mapKey('<leader>fh', builtin.help_tags)


-- [Plugin] hop
-- normal 모드에서 단어 찾아 커서 이동
mapKey('<leader>s', require("hop").hint_char2)


-- [Plugin] FTerm
-- normal 모드에서 터미널 창 띄우기
mapKey('<leader>t', require("FTerm").toggle)


-- [Plugin] vim-illuminate
-- normal 모드에서 현재 가리키는 다음/이전 인스턴스 따라가기
mapKey(']t', require("illuminate").goto_next_reference)
mapKey('[t', require("illuminate").goto_prev_reference)


-- [Plugin] gitsigns
-- normal 모드에서 git change 다음 지점으로 이동
mapKey(']g', require('gitsigns').next_hunk)
mapKey('[g', require('gitsigns').prev_hunk)
-- normal 모드에서 git change 등록하기(A:현재파일 전체)
mapKey('gha', require('gitsigns').stage_hunk)
mapKey('ghA', require('gitsigns').stage_buffer)
-- normal 모드에서 git change 취소하기
mapKey('ghu', require('gitsigns').undo_stage_hunk)
-- normal 모드에서 git change 변경사항 폐기 및 원상복귀(U:현재파일 전체)
mapKey('ghr', require('gitsigns').reset_hunk)
mapKey('ghR', require('gitsigns').reset_buffer)
-- normal 모드에서 파일 변경점 확인하기
mapKey('ghd', require('gitsigns').diffthis)
-- normal 모드에서 코드 변경자 확인하기
mapKey('ghb', function() require('gitsigns').blame_line { full = true } end)


-- [Plugin] nvim-lspconfig
-- normal 모드에서 코드 문법에 대해 hover 하여 설명 보기
mapKey('?', vim.lsp.buf.hover)
-- normal 모드에서 선언부 찾기
mapKey('gd', vim.lsp.buf.definition)
-- normal 모드에서 구현부 찾기
mapKey('gi', vim.lsp.buf.implementation)
-- normal 모드에서 사용처 찾기
mapKey('gr', vim.lsp.buf.references)
-- code action
mapKey('<leader>ac', vim.lsp.buf.code_action)


-- [Plugin] nvim-dap
-- normal 모드에서 dap ui 열고 닫기
mapKey('<leader>du', function() require("dapui").toggle({}) end)
-- normal 모드에서 toggle breakpoint (with condition 지정)
mapKey('<leader>dB', function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
-- normal 모드에서 toggle breakpoint
mapKey('<leader>db', function() require("dap").toggle_breakpoint() end)
-- normal 모드에서 continue
mapKey('<leader>dc', function() require("dap").continue() end)
-- normal 모드에서 run with args
mapKey('<leader>da', function() require("dap").continue({ before = get_args }) end)
-- normal 모드에서 run to cursor
mapKey('<leader>dC', function() require("dap").run_to_cursor() end)
-- normal 모드에서 go to line (no execute)
mapKey('<leader>dg', function() require("dap").goto_() end)
-- normal 모드에서 step into
mapKey('<leader>di', function() require("dap").step_into() end)
-- normal 모드에서 step over
mapKey('<leader>do', function() require("dap").step_over() end)
-- normal 모드에서 step out
mapKey('<leader>dO', function() require("dap").step_out() end)
-- normal 모드에서 pause
mapKey('<leader>dp', function() require("dap").pause() end)
-- normal 모드에서 toggle repl
mapKey('<leader>dr', function() require("dap").repl.toggle() end)
-- normal 모드에서 session
mapKey('<leader>ds', function() require("dap").session() end)
-- normal 모드에서 session
mapKey('<leader>dt', function() require("dap").terminate() end)


-- [Plugin] nvim-java
-- normal 모드에서 runner terminal toggle & run main (toggle 열려있어야 실행됨)
mapKey('<leader>kr', function() require('java').runner.built_in.run_app({}) end)
mapKey('<leader>ko', function() require('java').runner.built_in.toggle_logs() end)
mapKey('<leader>kx', function() require('java').runner.built_in.toggle_logs() end)


-- maven pom.xml dependency & lsp 자동 업데이트
local function UpdatePomFileDependenciesAndLspServer()
	local current_file = vim.fn.expand('%:t')
	local current_file_full_path = vim.fn.expand('%:p')
	if current_file == "pom.xml" then
		vim.notify("Update pom.xml...", vim.log.levels.INFO, { title = "maven" })
		vim.cmd("silent !rm -r ~/.m2")
		-- async
		vim.loop.spawn("mvn", {
			args = { "-f", current_file_full_path, "dependency:purge-local-repository", "dependency:resolve" }
		}, function()
			vim.schedule(function()
				vim.cmd(":LspRestart")
				vim.notify("Update pom.xml is Done!", vim.log.levels.INFO, { title = "maven" })
				-- restart nvim-java plugin
				require("java").setup()
				require("lspconfig").jdtls.setup({})
			end)
		end)
	else
		vim.notify("Your file is not pom.xml.\n(Current file : " .. current_file .. ")", vim.log.levels.WARN,
			{ title = "maven" })
	end
end
mapKey('<leader>//', function() UpdatePomFileDependenciesAndLspServer() end)
