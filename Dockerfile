FROM node:lts

# https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-apt
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y curl git jq software-properties-common

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && \
  apt-add-repository https://cli.github.com/packages && \
  apt-get update && \
  apt-get install -y gh

RUN apt-get clean && \
  rm -rf /tmp/* /var/tmp/*