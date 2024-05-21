-- basic options setting
local opt = vim.opt

opt.syntax = "on"
opt.mouse:append("a")         -- 마우스 사용 허용
opt.wrap = false              -- 자동 줄바꿈 비활성화
opt.splitright = true         -- :vs 분할 시, 새 창을 오른쪽에 생성
opt.splitbelow = true         -- :sp 분할 시, 새 창을 아래에 생성
opt.encoding = "utf-8"        -- terminal 출력 utf-8 인코딩
opt.fileencoding = "utf-8"    -- file 저장형식 utf-8 인코딩
opt.cmdheight = 2             -- vim command 입력창 높이 2로 설정
opt.ruler = true              -- 우측 하단에 커서 위치 표시
opt.number = true             -- 라인번호 활성화
opt.pumheight = 10            -- 팝업메뉴(자동완성 등) 높이 10 설정
opt.ignorecase = true         -- search pattern에서 case-insensitive
opt.smartcase = true          -- search pattern 최적화
opt.smartindent = true        -- 들여쓰기 최적화
opt.smarttab = true           -- Tab 최적화
opt.shiftwidth = 4            -- Tab == 4Space
opt.tabstop = 4               -- Tab == 4Space
opt.laststatus = 2            -- 상태바 항상 표시
opt.showtabline = 2           -- 현재 열려있는 탭 항상 표시
opt.showmatch = true          -- 괄호쌍 표시
opt.showmode = false          -- --INSERT-- 숨김
opt.backup = false            -- 백업파일 비활성화
opt.writebackup = false       -- 백업파일 비활성화
opt.shortmess:append("c")     -- -- User defined completion 메세지 숨김처리
opt.updatetime = 200          -- completion 속도 향상
opt.timeoutlen = 250          -- 단축키 입력 타임아웃 설정
opt.clipboard = "unnamedplus" -- 클립보드 붙여넣기 허용
opt.incsearch = true          -- 검색어 입력 실시간 찾기 활성화
opt.hlsearch = true           -- 검색결과 하이라이트 활성화
opt.signcolumn = "yes:1"      -- Git 변경사항 표시 활성화
opt.hidden = true             -- 열려있는 탭 저장하지 않아도 다른 탭 이동 가능하도록 설정
opt.scrolloff = 8             -- 수직이동 여백 8칸 설정
opt.sidescrolloff = 8         -- 수평이동 여백 8칸 설정
opt.termguicolors = true      -- 256 이상 색상 활성화

-- <C-v> 텍스트 입력으로 처리 (붙여넣기로 사용하기 위함) (Deprecated in Neovim 0.10)
-- vim.o.termkey = '<C-V>'

-- 파일 열기 마지막 부분 저장
vim.cmd([[
   if has("autocmd")
   autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \ exe "normal g'\"" |
   \ endif
   endif
]])
