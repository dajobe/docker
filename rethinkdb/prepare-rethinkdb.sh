#!/bin/sh -x

. /build/config.sh

echo "deb http://download.rethinkdb.com/apt $release main" > /etc/apt/sources.list.d/rethinkdb.list

curl http://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -

apt-get update

apt-get install $minimal_apt_get_args rethinkdb python-pip

# Install python driver for rethinkdb
pip install rethinkdb
