# author : AndrewCogi
# Dockerfile for DalMuDee-IDE (base)
# Tag [base] : includes DalMuDee-IDE, Java 21, Python 3.12

FROM ubuntu:24.04

ENV HOME=/root

# Init
RUN apt update
RUN apt install sudo curl -y

# DalMuDee-IDE installation
RUN apt install git make cmake gettext -y
RUN rm -rf $HOME/neovim-installer
RUN git clone https://github.com/neovim/neovim.git $HOME/neovim-installer
WORKDIR $HOME/neovim-installer
RUN git checkout stable
RUN make CMAKE_BUILD_TYPE=Release
RUN sudo make install
WORKDIR $HOME
RUN rm -rf $HOME/neovim-installer
RUN apt install make zip gcc ripgrep jq npm openjdk-21-jdk -y
RUN rm -rf $HOME/.config/nvim
RUN git clone https://github.com/AndrewCogi/DalMuDee_v2.git $HOME/.config/nvim

CMD ["/bin/bash"]
