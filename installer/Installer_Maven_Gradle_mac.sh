#!/bin/bash

init() {
	echo "[Install_Maven_Gradle_mac.sh] Checking for Homebrew..."
	if ! command -v brew &> /dev/null; then
        echo "[Install_Maven_Gradle_mac.sh] Homebrew is not installed."
        echo "[Install_Maven_Gradle_mac.sh] Please install Homebrew and try again."
        echo "[Install_Maven_Gradle_mac.sh] Installation Site : https://brew.sh/"
        exit 1
    else
        echo "[Install_Maven_Gradle_mac.sh] Homebrew is already installed."
        brew update
        brew upgrade
    fi
}

install_prerequisite() {
	# brew install make zip
}

install_maven() {
	brew install maven
}

install_gradle() {
	brew install gradle
}


echo "[Install_Maven_Gradle_mac.sh] Welcome to Maven_Gradle installer"

echo "[Install_Maven_Gradle_mac.sh] Initializing..."
init

echo "[Install_Maven_Gradle_mac.sh] Installing prerequisite..."
install_prerequisite

echo "[Install_Maven_Gradle_mac.sh] Installing Maven..."
install_maven

echo "[Install_Maven_Gradle_mac.sh] Installing Gradle..."
install_gradle

echo "[Install_Maven_Gradle_mac.sh] Installation Complete!"
