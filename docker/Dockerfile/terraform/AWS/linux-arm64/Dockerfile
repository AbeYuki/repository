FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    software-properties-common \
    ca-certificates \
    curl \
    gnupg \
    wget \
    zip \
    unzip \
    && wget https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_arm64.zip \
    && unzip terraform_1.0.9_linux_arm64.zip \
    && mv terraform /usr/local/bin/
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64-2.2.45.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install
ENTRYPOINT [ "/bin/bash" ]