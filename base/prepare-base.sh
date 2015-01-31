#!/bin/sh -x
#
# See https://github.com/docker/docker/blob/master/contrib/mkimage/debootstrap

. /build/config.sh

# Update the package repository and install base packages (no recommends)
apt-get update

apt-get dist-upgrade $minimal_apt_get_args

# Install:
# Locales support
#   locales
# Certificates
#   ca-certificates
#   (pulls in openssl)
# Curl

apt-get install $minimal_apt_get_args \
	locales \
	ca-certificates \
	curl

lang=en_US.UTF-8
lc_ctype=en_US.UTF-8

# Fix locale
echo "$lang UTF-8" > /etc/locale.gen
locale-gen
update-locale LANG=$lang

# Ensure shell gets the environment changes
for file in /etc/profile /etc/bash.bashrc; do
  cat >> $file <<EOF

# Added by prepare.sh
export LC_CTYPE=$lc_ctype
export LANG=$lang
EOF
done
