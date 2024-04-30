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
