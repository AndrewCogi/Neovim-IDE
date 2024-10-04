-- DalMuDee configuration 업데이트 확인 및 업데이트 실시 여부 확인하는 함수
local function check_git_updates()
	-- git fetch로 원격 저장소의 업데이트 확인
	local git_fetch = os.execute('git -C ~/.config/nvim fetch')

	-- 원격과 로컬 브랜치의 차이 확인
	local handle = io.popen('git -C ~/.config/nvim rev-list HEAD..@{upstream} --count')
	local result = handle:read("*a")
	handle:close()

	local update_count = tonumber(result)

	if update_count == nil or update_count == 0 then
		print("Neovim configuration is up-to-date.")
		return
	end

	-- 업데이트가 있으면 사용자에게 알림
	local choice = vim.fn.input(
	"A new version of your Neovim configuration is available. Do you want to update now and restart Neovim? (yes/no): ")

	if choice:lower() == "yes" then
		-- git pull 실행
		os.execute('git -C ~/.config/nvim pull')
		print("Neovim configuration has been updated. Neovim will now restart to apply the changes.")

		-- Neovim 종료
		vim.cmd('qa!')
	else
		print("You can manually update by running 'git pull' in ~/.config/nvim.")
	end
end

return {
	check_git_updates = check_git_updates
}
