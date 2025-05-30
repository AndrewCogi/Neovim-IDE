#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BOLD='\033[1m'
NC='\033[0m'

detect_architecture() {
	uname_out="$(uname -sm)"
  
  	case "${uname_out}" in
		"Linux x86_64")
			echo "linux-amd64"
      		;;
    	"Linux aarch64")
      		echo "linux-arm64"
      		;;
    	"Darwin x86_64")
      		echo "macos-amd64"
      		;;
    	"Darwin arm64")
      		echo "macos-arm64"
      		;;
    	*)
			echo -e ${RED}"Detected architecture: ${uname_out}\n    I'm Sorry. This architecture is not supported." >&2
      		exit 1
      		;;
  esac
}

echo -e ${GREEN}"[DalMuDee_IDE] Checking if the DalMuDee is compatible with your architecture..."${NC}
architecture=$(detect_architecture) || exit 1
echo -e "Detected architecture: ${architecture}\n    Compatible architecture detected. Starting installation..."

case $architecture in
	"linux-amd64")
		echo -e ${GREEN}"[DalMuDee_IDE (1/11)] Updating package lists..."${NC}
		sudo apt update

		echo -e ${GREEN}"[DalMuDee_IDE (2/11)] Installing essential components for Neovim build...\n    (git make cmake gettext)"${NC}
		sudo apt install git make cmake gettext -y

		echo -e ${GREEN}"[DalMuDee_IDE (3/11)] Installing Neovim..."${NC}
		if command -v nvim &> /dev/null
		then
			echo -e ${GREEN}"[DalMuDee_IDE (3/11)] Neovim is already installed. Skipping installation."${NC}
		else
			rm -rf $HOME/neovim-installer
			git clone https://github.com/neovim/neovim.git $HOME/neovim-installer
			cd $HOME/neovim-installer
			git checkout stable
			make CMAKE_BUILD_TYPE=Release
			sudo make install
			cd $HOME
			rm -rf $HOME/neovim-installer
		fi

		echo -e ${GREEN}"[DalMuDee_IDE (4/11)] Installing essential components for DalMuDee...(make)"${NC}
		sudo apt install make -y

		echo -e ${GREEN}"[DalMuDee_IDE (5/11)] Installing essential components for DalMuDee...(zip)"${NC}
		sudo apt install zip -y

		echo -e ${GREEN}"[DalMuDee_IDE (6/11)] Installing essential components for DalMuDee...(gcc)"${NC}
		sudo apt install gcc -y

		echo -e ${GREEN}"[DalMuDee_IDE (7/11)] Installing essential components for DalMuDee...(ripgrep)"${NC}
		sudo apt install ripgrep -y

		echo -e ${GREEN}"[DalMuDee_IDE (8/11)] Installing essential components for DalMuDee...(jq)"${NC}
		sudo apt install jq -y

		echo -e ${GREEN}"[DalMuDee_IDE (9/11)] Installing essential components for DalMuDee...(npm)"${NC}
		sudo apt install npm -y

		echo -e ${GREEN}"[DalMuDee_IDE (10/11)] Installing essential components for DalMuDee...(java 21)"${NC}
		sudo apt install openjdk-21-jdk -y

		echo -e ${GREEN}"[DalMuDee_IDE (11/11)] Copying DalMuDee configuration file from git..."${NC}
		rm -rf ~/.config/nvim
		git clone https://github.com/AndrewCogi/DalMuDee_v2.git ~/.config/nvim

		echo -e ${GREEN}"[DalMuDee_IDE] Installation Complete!\n"${NC}${YELLOW}"    Now you can run neovim using the 'nvim' command.\n    (First time running, it may take some time due to plugin installation)"${NC}
		;;
	"linux-arm64")
		echo -e ${GREEN}"[DalMuDee_IDE (1/11)] Updating package lists..."${NC}
		sudo apt update

		echo -e ${GREEN}"[DalMuDee_IDE (2/11)] Installing essential components for Neovim build...\n    (git make cmake gettext)"${NC}
		sudo apt install git make cmake gettext -y

		echo -e ${GREEN}"[DalMuDee_IDE (3/11)] Installing Neovim..."${NC}
		if command -v nvim &> /dev/null
		then
			echo -e ${GREEN}"[DalMuDee_IDE (3/11)] Neovim is already installed. Skipping installation."${NC}
		else
			rm -rf $HOME/neovim-installer
			git clone https://github.com/neovim/neovim.git $HOME/neovim-installer
			cd $HOME/neovim-installer
			git checkout stable
			make CMAKE_BUILD_TYPE=Release
			sudo make install
			cd $HOME
			rm -rf $HOME/neovim-installer
		fi

		echo -e ${GREEN}"[DalMuDee_IDE (4/11)] Installing essential components for DalMuDee...(make)"${NC}
		sudo apt install make -y

		echo -e ${GREEN}"[DalMuDee_IDE (5/11)] Installing essential components for DalMuDee...(zip)"${NC}
		sudo apt install zip -y

		echo -e ${GREEN}"[DalMuDee_IDE (6/11)] Installing essential components for DalMuDee...(gcc)"${NC}
		sudo apt install gcc -y

		echo -e ${GREEN}"[DalMuDee_IDE (7/11)] Installing essential components for DalMuDee...(ripgrep)"${NC}
		sudo apt install ripgrep -y

		echo -e ${GREEN}"[DalMuDee_IDE (8/11)] Installing essential components for DalMuDee...(jq)"${NC}
		sudo apt install jq -y

		echo -e ${GREEN}"[DalMuDee_IDE (9/11)] Installing essential components for DalMuDee...(npm)"${NC}
		sudo apt install npm -y

		echo -e ${GREEN}"[DalMuDee_IDE (10/11)] Installing essential components for DalMuDee...(java 21)"${NC}
		sudo apt install openjdk-21-jdk -y

		echo -e ${GREEN}"[DalMuDee_IDE (11/11)] Copying DalMuDee configuration file from git..."${NC}
		rm -rf ~/.config/nvim
		git clone https://github.com/AndrewCogi/DalMuDee_v2.git ~/.config/nvim

		echo -e ${GREEN}"[DalMuDee_IDE] Installation Complete!\n"${NC}${YELLOW}"    Now you can run neovim using the 'nvim' command.\n    (First time running, it may take some time due to plugin installation)"${NC}
		;;
	"macos-amd64")
		echo -e ${GREEN}"[DalMuDee_IDE (1/10)] Checking for Homebrew installation..."${NC}
		if ! command -v brew &> /dev/null; then
			echo -e ${YELLOW}"[DalMuDee_IDE (1/10)] Homebrew is not installed.\n    Please install Homebrew and try again.\n    Installation Site : https://brew.sh/"${NC}
			exit 1
		else
			echo -e ${GREEN}"[DalMuDee_IDE (1/10)] Homebrew is already installed. Updating homebrew..."${NC}
			brew update
		fi

		echo -e ${GREEN}"[DalMuDee_IDE (2/10)] Installing Neovim..."${NC}
		brew install neovim

		echo -e ${GREEN}"[DalMuDee_IDE (3/10)] Installing essential components for DalMuDee...(make)"${NC}
		brew install make

		echo -e ${GREEN}"[DalMuDee_IDE (4/10)] Installing essential components for DalMuDee...(zip)"${NC}
		brew install zip

		echo -e ${GREEN}"[DalMuDee_IDE (5/10)] Installing essential components for DalMuDee...(gcc)"${NC}
		brew install gcc

		echo -e ${GREEN}"[DalMuDee_IDE (6/10)] Installing essential components for DalMuDee...(ripgrep)"${NC}
		brew install ripgrep

		echo -e ${GREEN}"[DalMuDee_IDE (7/10)] Installing essential components for DalMuDee...(jq)"${NC}
		brew install jq

		echo -e ${GREEN}"[DalMuDee_IDE (8/10)] Installing essential components for DalMuDee...(npm)"${NC}
		brew install node

		echo -e ${GREEN}"[DalMuDee_IDE (9/10)] Installing essential components for DalMuDee...(java 21)"${NC}
		brew install openjdk@21
		echo 'export JAVA_HOME=$(brew --prefix openjdk@21)/libexec/openjdk.jdk/Contents/Home' >> ~/.zshrc
		echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.zshrc
		source ~/.zshrc

		echo -e ${GREEN}"[DalMuDee_IDE (10/10)] Copying DalMuDee configuration file from git..."${NC}
		rm -rf ~/.config/nvim
		git clone https://github.com/AndrewCogi/DalMuDee_v2.git ~/.config/nvim

		echo -e ${GREEN}"[DalMuDee_IDE] Installation Complete!\n"${NC}${YELLOW}"    Now you can run neovim using the 'nvim' command.\n    (First time running, it may take some time due to plugin installation)"${NC}
		;;
	"macos-arm64")
		echo -e ${GREEN}"[DalMuDee_IDE (1/10)] Checking for Homebrew installation..."${NC}
		if ! command -v brew &> /dev/null; then
			echo -e ${YELLOW}"[DalMuDee_IDE (1/10)] Homebrew is not installed.\n    Please install Homebrew and try again.\n    Installation Site : https://brew.sh/"${NC}
			exit 1
		else
			echo -e ${GREEN}"[DalMuDee_IDE (1/10)] Homebrew is already installed. Updating homebrew..."${NC}
			brew update
		fi

		echo -e ${GREEN}"[DalMuDee_IDE (2/10)] Installing Neovim..."${NC}
		brew install neovim

		echo -e ${GREEN}"[DalMuDee_IDE (3/10)] Installing essential components for DalMuDee...(make)"${NC}
		brew install make

		echo -e ${GREEN}"[DalMuDee_IDE (4/10)] Installing essential components for DalMuDee...(zip)"${NC}
		brew install zip

		echo -e ${GREEN}"[DalMuDee_IDE (5/10)] Installing essential components for DalMuDee...(gcc)"${NC}
		brew install gcc

		echo -e ${GREEN}"[DalMuDee_IDE (6/10)] Installing essential components for DalMuDee...(ripgrep)"${NC}
		brew install ripgrep

		echo -e ${GREEN}"[DalMuDee_IDE (7/10)] Installing essential components for DalMuDee...(jq)"${NC}
		brew install jq

		echo -e ${GREEN}"[DalMuDee_IDE (8/10)] Installing essential components for DalMuDee...(npm)"${NC}
		brew install node

		echo -e ${GREEN}"[DalMuDee_IDE (9/10)] Installing essential components for DalMuDee...(java 21)"${NC}
		brew install openjdk@21
		echo 'export JAVA_HOME=$(brew --prefix openjdk@21)/libexec/openjdk.jdk/Contents/Home' >> ~/.zshrc
		echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.zshrc
		source ~/.zshrc

		echo -e ${GREEN}"[DalMuDee_IDE (10/10)] Copying DalMuDee configuration file from git..."${NC}
		rm -rf ~/.config/nvim
		git clone https://github.com/AndrewCogi/DalMuDee_v2.git ~/.config/nvim

		echo -e ${GREEN}"[DalMuDee_IDE] Installation Complete!\n"${NC}${YELLOW}"    Now you can run neovim using the 'nvim' command.\n    (First time running, it may take some time due to plugin installation)"${NC}
		;;
	*)
esac
