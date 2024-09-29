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

install_maven() {
	sudo apt install maven -y
}

install_gradle() {
	sdk install gradle
}


echo "[Install_Maven_Gradle_ubuntu_x86_64.sh] Welcome to Maven_Gradle installer"

echo "[Install_Maven_Gradle_ubuntu_x86_64.sh] Initializing..."
init

echo "[Install_Maven_Gradle_ubuntu_x86_64.sh] Installing prerequisite..."
install_prerequisite

echo "[Install_Maven_Gradle_ubuntu_x86_64.sh] Installing sdkman for Gradle..."
install_sdkman

echo "[Install_Maven_Gradle_ubuntu_x86_64.sh] Installing Maven..."
install_maven

echo "[Install_Maven_Gradle_ubuntu_x86_64.sh] Installing Gradle..."
install_gradle

echo "[Install_Maven_Gradle_ubuntu_x86_64.sh] Installation Complete!"
