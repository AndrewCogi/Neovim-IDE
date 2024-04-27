-- mapping setting

local mapKey = require("utils.keyMapper").mapKey

-- normal 모드에서 Tab 누르면 다음 탭으로 이동
mapKey('<TAB>', ':bnext<CR>')
-- normal 모드에서 Shift-Tab 누르면 이전 탭으로 이동
mapKey('<S-TAB>', ':bprevious<CR>')

-- normal 모드에서 탭 삭제, 다음/이전 탭으로 이동
mapKey('<leader>bn', ':bnext<CR>')
mapKey('<leader>bp', ':bprevious<CR>')
mapKey('<leader>bd', ':bdelete<CR>')

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
mapKey('<C-Up>',    ':resize -1<CR>')
mapKey('<C-Down>',  ':resize +1<CR>')
mapKey('<C-Left>',  ':vertical resize -2<CR>')
mapKey('<C-Right>', ':vertical resize +2<CR>')

-- visual 모드에서 >> << 실행 후에도 visual block 유지
mapKey('<', '<gv', 'v')
mapKey('>', '>gv', 'v')

-- normal 모드에서 search highlight 삭제
mapKey('<leader>h', ':nohlsearch<CR>')

-- diagnostic 찾기
mapKey(']c', vim.diagnostic.goto_next)
mapKey('[c', vim.diagnostic.goto_prev)


-- [Plugin] neo-tree
-- file explorer 열고 닫기
mapKey('<leader>e', ':Neotree toggle<CR>')

-- [Plugin] nvim-osc52
-- visual 모드에서 ctrl+c 클립보드 저장
-- 붙여넣기는 cmd+v 사용 (iOS)
mapKey('<C-c>', 'y', 'x')
mapKey('<C-v>', 'p')
mapKey('<C-v>', 'p', 'x')

-- [Plugin] telescope
local builtin = require('telescope.builtin')
-- 파일 찾기
mapKey('<leader>ff', builtin.find_files)
-- 코드 내 찾기 (ripgrep 설치 필요)
mapKey('<leader>fg', builtin.live_grep)
-- 탭 찾기
mapKey('<leader>fb', builtin.buffers)
-- 도움말 찾기
mapKey('<leader>fh', builtin.help_tags)

-- [Plugin] kommentary
-- normal 모드에서 ctrl+/ 로 주석처리, visual 모드에서 ctrl+/ 로 주석처리
mapKey('<C-_>', '<Plug>kommentary_line_default')
mapKey('<C-_>', '<Plug>kommentary_visual_default', 'x')

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

-- [Plugin] nvim-ufo
-- normal 모드에서 코드 블록 단위로 접고 펼치기
-- za : 접기/펼치기
-- zm : 그룹 접기
mapKey('zM', require('ufo').closeAllFolds)
-- zr : 그룹 펼치기
mapKey('zR', require('ufo').openAllFolds)

-- [Plugin] hop
-- normal 모드에서 단어찾아 커서이동
mapKey('<leader>s', require('hop').hint_char2)

-- [Plugin] FTerm
-- normal 모드에서 터미널 창 띄우기 
mapKey('<leader>t', require('FTerm').toggle)

-- [Plugin] nvim-dap-ui
-- normal 모드에서 debugger 창 띄우기
mapKey('<leader>do', ":DapUIOpen<CR>")
-- normal 모드에서 debugger 창 닫기
mapKey('<leader>dx', ":DapUIClose<CR>")

-- [Plugin] noice
-- normal 모드에서 메세지 기록 보기
mapKey('<leader>ms', function() require('noice').cmd("all") end)
-- normal 모드에서 마지막 메세지 보기
mapKey('<leader>ml', function() require('noice').cmd("last") end)

-- [Plugin] gitsigns
-- normal 모드에서 git change 다음 지점으로 이동
mapKey(']g', require('gitsigns').next_hunk)
mapKey('[g', require('gitsigns').prev_hunk)
-- normal 모드에서 git change 등록하기(A:현재파일 전체)
mapKey('ga', require('gitsigns').stage_hunk)
mapKey('gA', require('gitsigns').stage_buffer)
-- normal 모드에서 git change 취소하기
mapKey('gu', require('gitsigns').undo_stage_hunk)
-- normal 모드에서 git change 변경사항 폐기 및 원상복귀(U:현재파일 전체)
mapKey('gr', require('gitsigns').reset_hunk)
mapKey('gR', require('gitsigns').reset_buffer)
-- normal 모드에서 파일 변경점 확인하기
mapKey('gd', require('gitsigns').diffthis)
-- normal 모드에서 코드 변경자 확인하기
mapKey('gb', function() require('gitsigns').blame_line{full=true} end)
