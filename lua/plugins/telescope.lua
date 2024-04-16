-- fuzzy finder (파일 검색, 코드 내 검색, 탭 찾기 기능)
local mapKey = require('utils.keyMapper').mapKey
return {
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim' }
}
