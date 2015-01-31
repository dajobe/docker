#!/bin/sh -x

. /build/config.sh

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
