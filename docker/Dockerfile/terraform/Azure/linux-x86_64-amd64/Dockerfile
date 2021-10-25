FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    software-properties-common \
    ca-certificates \
    lsb-release \
    curl \
    gnupg \
    wget \
    zip \
    unzip \
    ssh \
    && wget https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip \
    && unzip terraform_1.0.9_linux_amd64.zip \
    && mv terraform /usr/local/bin/
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null \
    && AZ_REPO=$(lsb_release -cs) \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    tee /etc/apt/sources.list.d/azure-cli.list \
    && apt-get update \
    && apt-get install azure-cli \
    && mkdir ~/.ssh/ ~/.azure
ENTRYPOINT [ "/bin/bash" ]