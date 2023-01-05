FROM node:lts

# https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-apt
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y curl git jq software-properties-common

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && apt update \
  && apt install gh -y

RUN apt-get clean && \
  rm -rf /tmp/* /var/tmp/*
