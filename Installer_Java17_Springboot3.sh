#!/bin/bash -i

set -o nounset		# 미선언 변수 접근 시 에러처리
set -o errexit 		# 에러 발생 시 중지

init() { \
	sudo apt update
	sudo apt upgrade -y
}

install_java17() { \
	sudo apt install openjdk-17-jdk -y
}

install_sdkman() { \
	curl -s https://get.sdkman.io | bash
	. "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk version
}

install_springboot3() { \
	sdk install springboot
}


echo "[Install_Java17_Springboot3.sh] Welcome to Java17_Springboot3 installer"

echo "[Install_Java17_Springboot3.sh] Initializing..."
init

echo "[Install_Java17_Springboot3.sh] Installing Java17..."
install_java17

echo "[Install_Java17_Springboot3.sh] Installing sdkman for Springboot3..."
install_sdkman

echo "[Install_Java17_Springboot3.sh] Installing Springboot3..."
install_springboot3

echo "[Install_Java17_Springboot3.sh] Installation Complete!"
echo "[Install_DalMuDee_v2_config.sh] You can find more instructions here. (https://www.lesstif.com/java/springboot-cli-113347033.html)"
