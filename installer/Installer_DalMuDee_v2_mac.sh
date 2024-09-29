#!/bin/bash

init() {
    echo "[Install_DalMuDee_v2_mac.sh] Checking for Homebrew..."
    if ! command -v brew &> /dev/null; then
        echo "[Install_DalMuDee_v2_mac.sh] Homebrew is not installed."
        echo "[Install_DalMuDee_v2_mac.sh] Please install Homebrew and try again."
        echo "[Install_DalMuDee_v2_mac.sh] Installation Site : https://brew.sh/"
        exit 1
    else
        echo "[Install_DalMuDee_v2_mac.sh] Homebrew is already installed."
        brew update
        brew upgrade
    fi
}

install_neovim() {
	brew install neovim
}

install_prerequisite() {
	brew install make zip gcc ripgrep jq node
}

install_devpod() {
	uname_out="$(uname -sm)"

	case "${uname_out}" in 
		"Darwin x86_64")
			echo "[Install_DalMuDee_v2_mac.sh] Detected architecture: [macos-amd64]"
			url="https://github.com/loft-sh/devpod/releases/latest/download/devpod-darwin-amd64"
			;;
		"Darwin arm64")
			echo "[Install_DalMuDee_v2_mac.sh] Detected architecture: [macos-arm64]"
			url="https://github.com/loft-sh/devpod/releases/latest/download/devpod-darwin-arm64"
			;;
		*)
			echo "[Install_DalMuDee_v2_mac.sh] Error : Unsupported architecture: [${uname_out}]" >&2
			exit 1
			;;
	esac

  	curl -L $url -o /usr/local/bin/devpod
  	chmod +x /usr/local/bin/devpod
}

install_java17() {
    brew install openjdk@17
    echo 'export JAVA_HOME=$(brew --prefix openjdk@17)/libexec/openjdk.jdk/Contents/Home' >> ~/.zshrc
    echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.zshrc
    source ~/.zshrc
}

install_DalMuDee_v2_config() {
	git clone https://github.com/AndrewCogi/DalMuDee_v2.git ~/.config/nvim
}


echo "[Install_DalMuDee_v2_mac.sh] Welcome to DalMuDee_v2 installer"

echo "[Install_DalMuDee_v2_mac.sh] Initializing..."
init

echo "[Install_DalMuDee_v2_mac.sh] Installing Neovim..."
install_neovim

echo "[Install_DalMuDee_v2_mac.sh] Installing prerequisite..."
install_prerequisite
install_devpod
install_java17

echo "[Install_DalMuDee_v2_mac.sh] Installing DalMuDee_v2 config..."
install_DalMuDee_v2_config

echo "[Install_DalMuDee_v2_mac.sh] Installation Complete!"
echo "[Install_DalMuDee_v2_mac.sh] Now you can run neovim using the 'nvim' command."
echo "[Install_DalMuDee_v2_mac.sh] (First time running, it may take some time due to plugin installation)"
