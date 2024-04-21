-- fuzzy finder (파일 검색, 코드 내 검색, 탭 찾기 기능)
return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require('telescope').setup({
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown{
						}
					}
				}
			})
			require('telescope').load_extension('ui-select')
		end,
	}
}
