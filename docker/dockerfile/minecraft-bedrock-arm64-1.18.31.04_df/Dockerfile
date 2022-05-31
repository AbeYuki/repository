FROM debian:stable-slim
ENV BEDROCK_SERVER_VERSION=1.18.31.04
RUN apt-get update && apt-get -qq install -y \
    software-properties-common \
    ca-certificates \
    curl \
    gnupg \
    wget \
    zip \
    unzip \
    cmake \
    make \
    git 
RUN git clone https://github.com/ptitSeb/box64 \
    && cd box64;mkdir build; cd build; cmake .. -DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo;make -j4;make install
RUN curl -O https://minecraft.azureedge.net/bin-linux/bedrock-server-1.18.31.04.zip \
    && unzip bedrock-server-1.18.31.04.zip -d bedrock-server && rm bedrock-server-1.18.31.04.zip
WORKDIR /bedrock-server