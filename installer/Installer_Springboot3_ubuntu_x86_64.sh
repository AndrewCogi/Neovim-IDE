#!/bin/bash

init() {
	sudo apt update
	sudo apt upgrade -y
}

install_prerequisite() {
	sudo apt install make zip -y
}

install_sdkman() {
	curl -s https://get.sdkman.io | bash
	source $HOME/.sdkman/bin/sdkman-init.sh
	sdk version
}

install_springboot3() {
	sdk install springboot
}


echo "[Install_Springboot3_ubuntu_x86_64.sh] Welcome to Springboot3 installer"

echo "[Install_Springboot3_ubuntu_x86_64.sh] Initializing..."
init

echo "[Install_Springboot3_ubuntu_x86_64.sh] Installing prerequisite..."
install_prerequisite

echo "[Install_Springboot3_ubuntu_x86_64.sh] Installing sdkman for Springboot3..."
install_sdkman

echo "[Install_Springboot3_ubuntu_x86_64.sh] Installing Springboot3..."
install_springboot3

echo "[Install_Springboot3_ubuntu_x86_64.sh] Installation Complete!"
