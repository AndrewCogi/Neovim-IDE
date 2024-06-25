#!/bin/bash

init() { \
	sudo apt update
	sudo apt upgrade -y
}

install_prerequisite() { \
	sudo apt install make zip -y
}

install_java17() { \
	sudo apt install openjdk-17-jdk -y
}

install_sdkman() { \
	curl -s https://get.sdkman.io | bash
	source $HOME/.sdkman/bin/sdkman-init.sh
	sdk version
}

install_maven() { \
	sudo apt install maven -y
}

install_gradle() { \
	sdk install gradle
}

install_springboot3() { \
	sdk install springboot
}


echo "[Install_Java17_Springboot3_Maven_Gradle.sh] Welcome to Java17_Springboot3_Maven_Gradle installer"

echo "[Install_Java17_Springboot3_Maven_Gradle.sh] Initializing..."
init

echo "[Install_Java17_Springboot3_Maven_Gradle.sh] Installing prerequisite..."
install_prerequisite

echo "[Install_Java17_Springboot3_Maven_Gradle.sh] Installing Java17..."
install_java17

echo "[Install_Java17_Springboot3_Maven_Gradle.sh] Installing sdkman for Gradle & Springboot3..."
install_sdkman

echo "[Install_Java17_Springboot3_Maven_Gradle.sh] Installing Maven..."
install_maven

echo "[Install_Java17_Springboot3_Maven_Gradle.sh] Installing Gradle..."
install_gradle

echo "[Install_Java17_Springboot3_Maven_Gradle.sh] Installing Springboot3..."
install_springboot3

echo "[Install_Java17_Springboot3_Maven_Gradle.sh] Installation Complete!"
