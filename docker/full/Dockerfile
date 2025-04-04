# author : AndrewCogi
# Dockerfile for DalMuDee-IDE (full)
# Tag [full] : includes DalMuDee-IDE, Java 21, Python 3.12, Springboot 3, Anaconda, Build tools (Maven/Gradle)

FROM chohyunsik/dalmudee-ide:base

ENV HOME=/root
ENV CONDA_DIR=/opt/anaconda3

# Init
RUN apt update

# Install Maven
RUN apt install maven -y

# Install Gradle
RUN curl -s https://get.sdkman.io | bash
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk version"
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk install gradle"

# Install Springboot 3
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk install springboot"

# Install Anaconda
RUN arch=$(uname -m) && \
    mkdir -p $HOME/anaconda-installer && \
    cd $HOME/anaconda-installer && \
    if [ "$arch" = "x86_64" ]; then \
        curl -O https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh && \
        bash Anaconda3-2024.06-1-Linux-x86_64.sh -b -p $CONDA_DIR; \
    elif [ "$arch" = "aarch64" ]; then \
        curl -O https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-aarch64.sh && \
        bash Anaconda3-2024.06-1-Linux-aarch64.sh -b -p $CONDA_DIR; \
    else \
        echo "Unsupported architecture: $arch" && exit 1; \
    fi && \
    rm -rf $HOME/anaconda-installer

# Init Anaconda
RUN $CONDA_DIR/bin/conda init

CMD ["/bin/bash"]
