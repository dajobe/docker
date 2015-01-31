#!/bin/sh -x

. /build/config.sh

# Or could install Oracle Java 7
#
# https://github.com/dockerfile/java/blob/master/oracle-java7/Dockerfile
#
# FROM dockerfile/java:oracle-java7
#
# or extract it out:
#  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
#  add-apt-repository -y ppa:webupd8team/java
#  apt-get update
#  apt-get install -y oracle-java7-installer


# Update the package repository
apt-get update

# Install the smallest java
apt-get install $minimal_apt_get_args \
  openjdk-7-jre-headless

java_home=/usr/lib/jvm/java-7-openjdk-amd64

# Ensure shells get the environment changes
for file in /etc/profile /etc/bash.bashrc; do
  cat >> $file <<EOF

# Added by java prepare.sh
export JAVA_HOME=$java_home
EOF
done
