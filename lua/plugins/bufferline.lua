-- 상단 버퍼 (탭) 표시 플러그인
return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require('bufferline').setup()
	end,
}


