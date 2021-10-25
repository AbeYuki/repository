FROM ubuntu:20.04
RUN apt-get update \
    && echo 6 | apt-get install tzdata \
    && apt-get install -y \
    software-properties-common \
    ca-certificates \
    curl \
    gnupg \
    wget \
    zip \
    unzip \
    python3 \
    python3-pip \
    ssh \
    && wget https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_arm64.zip \
    && unzip terraform_1.0.9_linux_arm64.zip \
    && mv terraform /usr/local/bin/ \
    && mkdir ~/.ssh/ ~/.azure
RUN pip3 install azure-cli
ENTRYPOINT [ "/bin/bash" ]