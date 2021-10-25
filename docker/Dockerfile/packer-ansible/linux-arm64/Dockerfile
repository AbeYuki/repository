FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    software-properties-common \
    ca-certificates \
    curl \
    gnupg \
    wget \
    zip \
    unzip \
    && curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
    && apt-add-repository "deb [arch=arm64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && apt-get update && apt-get install -y packer \
    && apt-add-repository --yes --update ppa:ansible/ansible \
    && apt-get install -y ansible
CMD ["/bin/bash"]