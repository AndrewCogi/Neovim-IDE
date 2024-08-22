#!/bin/bash

init() { 
    echo "[Install_DalMuDee_v2.sh] Checking for Homebrew..."
    if ! command -v brew &> /dev/null; then
        echo "[Install_DalMuDee_v2.sh] Homebrew is not installed."
        echo "[Install_DalMuDee_v2.sh] Please install Homebrew and try again."
        echo "[Install_DalMuDee_v2.sh] Installation Site : https://brew.sh/"
        exit 1
    else
        echo "[Install_DalMuDee_v2.sh] Homebrew is already installed."
        brew update
        brew upgrade
    fi
}

install_neovim() { \
	brew install neovim
}

install_prerequisite() { \
	brew install make zip gcc ripgrep jq node
}

install_DalMuDee_v2_config() { \
	git clone https://github.com/AndrewCogi/DalMuDee_v2.git ~/.config/nvim
}


echo "[Install_DalMuDee_v2.sh] Welcome to DalMuDee_v2 installer"

echo "[Install_DalMuDee_v2.sh] Initializing..."
init

echo "[Install_DalMuDee_v2.sh] Installing Neovim..."
install_neovim

echo "[Install_DalMuDee_v2.sh] Installing prerequisite..."
install_prerequisite

echo "[Install_DalMuDee_v2.sh] Installing DalMuDee_v2 config..."
install_DalMuDee_v2_config

echo "[Install_DalMuDee_v2.sh] Installation Complete!"
echo "[Install_DalMuDee_v2.sh] Now you can run neovim using the 'nvim' command."
echo "[Install_DalMuDee_v2.sh] (First time running, it may take some time due to plugin installation)"
