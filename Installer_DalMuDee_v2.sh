#!/bin/bash

init() { \
	sudo apt update
	sudo apt upgrade -y
}

install_neovim() { \
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
	sudo rm -f nvim-linux64.tar.gz
	echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> $HOME/.bashrc
 	source $HOME/.bashrc
}

install_prerequisite() { \
	sudo apt install make zip gcc ripgrep jq nodejs npm -y
}

install_DalMuDee_v2_config() { \
	git clone https://github.com/AndrewCogi/DalMuDee_v2.git ~/.config/nvim
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
echo "[Install_DalMuDee_v2_config.sh] Now you can run neovim using the 'nvim' command."
echo "[Install_DalMuDee_v2_config.sh] (First time running, it may take some time due to plugin installation)"
