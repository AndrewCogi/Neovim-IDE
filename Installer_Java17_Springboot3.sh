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

install_springboot3() { \
	sdk install springboot
}


echo "[Install_Java17_Springboot3.sh] Welcome to Java17_Springboot3 installer"

echo "[Install_Java17_Springboot3.sh] Initializing..."
init

echo "[Install_Java17_Springboot3.sh] Installing prerequisite..."
install_prerequisite

echo "[Install_Java17_Springboot3.sh] Installing Java17..."
install_java17

echo "[Install_Java17_Springboot3.sh] Installing sdkman for Springboot3..."
install_sdkman

echo "[Install_Java17_Springboot3.sh] Installing Springboot3..."
install_springboot3

echo "[Install_Java17_Springboot3.sh] Installation Complete!"
echo "[Install_DalMuDee_v2_config.sh] You can find more instructions here. (https://www.lesstif.com/java/springboot-cli-113347033.html)"
