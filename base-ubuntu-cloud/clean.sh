#!/bin/sh

apt-get clean

rm -rf /build

rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
# rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup

# Remove diverted binaries
rm -f /usr/bin/*.distrib
