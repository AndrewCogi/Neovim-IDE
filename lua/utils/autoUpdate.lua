-- DalMuDee configuration 업데이트 확인 및 업데이트 실시 여부 확인하는 함수
local function check_git_updates()

	-- 원격과 로컬 브랜치의 차이 확인
	local handle = io.popen('git -C ~/.config/nvim rev-list HEAD..@{upstream} --count')
	local result = handle:read("*a")
	handle:close()

	local update_count = tonumber(result)
	if update_count == nil or update_count == 0 then
		return
	end

	-- 업데이트가 있으면 사용자에게 알림
	local choice = vim.fn.input("A new version of your Neovim configuration is available. Do you want to update now and restart Neovim? (yes/[no]): ")

	if choice:lower() == "yes" then
		-- lazy-lock.json 파일을 제외하고 업데이트
		-- 1. lazy-lock.json을 stash로 저장
		os.execute('git -C ~/.config/nvim stash push -m "Exclude lazy-lock.json" lazy-lock.json')

		-- 2. git pull 실행
		os.execute('git -C ~/.config/nvim pull')

		-- 3. stash에서 lazy-lock.json 복원
		os.execute('git -C ~/.config/nvim stash apply --index')

		vim.cmd('qa!')
	end
end

return {
	check_git_updates = check_git_updates
}
