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
    && mkdir ~/.ssh ~/.aws ~/.gcp ~/.azure
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64-2.2.45.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-360.0.0-linux-arm.tar.gz \
    && tar -zxvf google-cloud-sdk-360.0.0-linux-arm.tar.gz \
    && rm google-cloud-sdk-360.0.0-linux-arm.tar.gz \
    && mv google-cloud-sdk /usr/local/bin \
    && echo 'if [ -f '/usr/local/bin/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.bash.inc'; fi' >> /root/.bashrc \
    && echo 'if [ -f '/usr/local/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/bin/google-cloud-sdk/completion.bash.inc'; fi' >> /root/.bashrc \
    && yes | /usr/local/bin//google-cloud-sdk/install.sh 
RUN pip3 install azure-cli
ENTRYPOINT [ "/bin/bash" ]