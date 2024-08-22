#!/bin/bash

init() {
	echo "[Install_Maven_Gradle.sh] Checking for Homebrew..."
	if ! command -v brew &> /dev/null; then
        echo "[Install_Maven_Gradle.sh] Homebrew is not installed."
        echo "[Install_Maven_Gradle.sh] Please install Homebrew and try again."
        echo "[Install_Maven_Gradle.sh] Installation Site : https://brew.sh/"
        exit 1
    else
        echo "[Install_Maven_Gradle.sh] Homebrew is already installed."
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


echo "[Install_Maven_Gradle.sh] Welcome to Maven_Gradle installer"

echo "[Install_Maven_Gradle.sh] Initializing..."
init

echo "[Install_Maven_Gradle.sh] Installing prerequisite..."
install_prerequisite

echo "[Install_Maven_Gradle.sh] Installing Maven..."
install_maven

echo "[Install_Maven_Gradle.sh] Installing Gradle..."
install_gradle

echo "[Install_Maven_Gradle.sh] Installation Complete!"
