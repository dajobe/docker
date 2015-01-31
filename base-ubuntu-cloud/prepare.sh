#!/bin/sh -x

# Prevent initramfs updates from trying to run grub and lilo.
export INITRD=no

export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

minimal_apt_get_args='-y --no-install-recommends'

# Temporarily disable dpkg fsync to make building faster.
if [ ! -e /etc/dpkg/dpkg.cfg.d/docker-apt-speedup ]; then
    echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup
fi

# Fix some issues with APT packages.
# See https://github.com/dotcloud/docker/issues/1024
dpkg-divert --local --rename --add /sbin/initctl
ln -sf /bin/true /sbin/initctl

# Update the package repository and install base packages (no recommends)
apt-get update \
   && apt-get dist-upgrade $minimal_apt_get_args

# Install:
# English locales (base; do not need firefox)
# Certificates
#   ca-certificates
#   (pulls in openssl)
# Curl

apt-get install $minimal_apt_get_args \
     language-pack-en-base \
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
