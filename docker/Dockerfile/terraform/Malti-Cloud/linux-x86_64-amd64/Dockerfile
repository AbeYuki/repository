FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    software-properties-common \
    ca-certificates \
    curl \
    gnupg \
    wget \
    zip \
    unzip \
    ssh \
    && wget https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip \
    && unzip terraform_1.0.9_linux_amd64.zip \
    && mv terraform /usr/local/bin/
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-360.0.0-linux-x86_64.tar.gz \
    && tar -zxvf google-cloud-sdk-360.0.0-linux-x86_64.tar.gz \
    && rm google-cloud-sdk-360.0.0-linux-x86_64.tar.gz \
    && mv google-cloud-sdk /usr/local/bin \
    && echo 'if [ -f '/usr/local/bin/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.bash.inc'; fi' >> /root/.bashrc \
    && echo 'if [ -f '/usr/local/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/bin/google-cloud-sdk/completion.bash.inc'; fi' >> /root/.bashrc \
    && yes | /usr/local/bin//google-cloud-sdk/install.sh \
    && mkdir ~/.gcp
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null \
    && AZ_REPO=$(lsb_release -cs) \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    tee /etc/apt/sources.list.d/azure-cli.list \
    && apt-get update \
    && apt-get install azure-cli \
    && mkdir ~/.ssh/
ENTRYPOINT [ "/bin/bash" ]