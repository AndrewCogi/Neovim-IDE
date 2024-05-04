#!/bin/bash -i

set -o nounset		# 미선언 변수 접근 시 에러처리
set -o errexit 		# 에러 발생 시 중지

init() { \
	sudo apt update
	sudo apt upgrade -y
}

install_neovim() { \
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
	sudo rm -f nvim-linux64.tar.gz
	echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
}

install_prerequisite() { \
	sudo apt install make zip gcc ripgrep -y
}

install_DalMuDee_v2_config() { \
	git clone https://github.com/AndrewCogi/DalMuDee_v2.git ~/.config/nvim
}

ask_reboot() { \
	echo "[Install_DalMuDee_v2_config.sh] Reboot required."
	echo -n "[Install_DalMuDee_v2_config.sh] Would you like to reboot to complete the installation of Neovim? (y/n) "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && reboot
}

reboot() { \
	echo "[Install_DalMuDee_v2_config.sh] After reboot, You can run neovim using the 'nvim' command."
	echo "[Install_DalMuDee_v2_config.sh] (First time running, it may take some time due to plugin installation)"
	echo "[Install_DalMuDee_v2_config.sh] See you soon!"
	sudo reboot now
}


echo "[Install_DalMuDee_v2_config.sh] Welcome to DalMuDee_v2 installer"

echo "[Install_DalMuDee_v2_config.sh] Initializing..."
init

echo "[Install_DalMuDee_v2_config.sh] Installing Neovim..."
install_neovim

echo "[Install_DalMuDee_v2_config.sh] Installing prerequisite..."
install_prerequisite

echo "[Install_DalMuDee_v2_config.sh] Installing DalMuDee_v2 config..."
install_DalMuDee_v2_config

echo "[Install_DalMuDee_v2_config.sh] Installation Complete!"
ask_reboot