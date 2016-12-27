#
# Feature Test Environment
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER ylu@luminatewireless.com

# Install Dependencies

RUN \
  cd / && \
  apt-get -y update && \
  apt-get install -y wget git zsh tshark iputils-ping bridge-utils iproute2 net-tools vim tmux && \
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" || true

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/bin/zsh"]
