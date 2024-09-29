#!/bin/bash

init() {
	sudo apt update
	sudo apt upgrade -y
}

install_neovim() {
	curl -LO https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
	sudo rm -f nvim-linux64.tar.gz
	echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> $HOME/.bashrc
 	source $HOME/.bashrc
}

install_prerequisite() {
	sudo apt install make zip gcc ripgrep jq npm -y
}

install_devpod() {
	uname_out="$(uname -sm)"

	case "${uname_out}" in 
		"Linux x86_64")
			echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] Detected architecture: [linux-amd64]"
			url="https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64"
			;;
		*)
			echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] Error : Unsupported architecture: [${uname_out}]" >&2
			exit 1
			;;
	esac

  	curl -L $url -o /usr/local/bin/devpod
  	chmod +x /usr/local/bin/devpod
}

install_java17() {
	sudo apt install openjdk-17-jdk -y
}

install_DalMuDee_v2_config() {
	git clone https://github.com/AndrewCogi/DalMuDee_v2.git ~/.config/nvim
}


echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] Welcome to DalMuDee_v2 installer"

echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] Initializing..."
init

echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] Installing Neovim..."
install_neovim

echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] Installing prerequisite..."
install_prerequisite
install_devpod
install_java17

echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] Installing DalMuDee_v2 config..."
install_DalMuDee_v2_config

echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] Installation Complete!"
echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] Now you can run neovim using the 'nvim' command."
echo "[Install_DalMuDee_v2_ubuntu_x86_64.sh] (First time running, it may take some time due to plugin installation)"
