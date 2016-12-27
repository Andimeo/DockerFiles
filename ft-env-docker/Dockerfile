#
# Feature Test Environment
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER ylu@tango.me

COPY source /etc/apt/sources.list
# Install Dependencies

RUN \
  cd / && \
  apt-get -y update && \
  apt-get install -y wget && \
  sh -c 'echo "deb http://opensource.wandisco.com/ubuntu trusty svn17" >> /etc/apt/sources.list.d/subversion17.list' && \
  wget -q http://opensource.wandisco.com/wandisco-debian.gpg -O- | apt-key add - && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y install libsvn1=1.7.21-1+WANdisco subversion=1.7.21-1+WANdisco libserf1=1.3.7-1+WANdisco && \
  apt-get -y install augeas-tools curl oracle-java7-installer && \
  apt-get -y install apt-utils && \
  echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
  echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
  apt-get -y install mysql-server && \
  apt-get install -y emacs23 xemacs21 libnotify-bin libasound2-dev libpulse-dev libssl0.9.8 python2.7-dev scons g++ valgrind libmysqlclient-dev mysql-client php5 php5-mysql apache2 libapache2-mod-php5 curl libncurses5-dev autoconf libexpat1-dev ntp openssh-server scons ant && \
  apt-get -y autoremove && \
  useradd -d /home/ft -s /bin/bash ft && \
  mkdir -p /home/ft/.tangobuild && \
  chown -R ft /home/ft && \
  chgrp -R ft /home/ft

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Define mountable directories.
VOLUME ["/codebase", "/home/ft/.tangobuild", "/home/ft/.ivy2"]

COPY bashrc /root/.bashrc
COPY my.cnf /etc/mysql/my.cnf

# Define working directory.
WORKDIR /codebase

# Define default command.
CMD ["/bin/bash"]
