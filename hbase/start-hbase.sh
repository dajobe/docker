#!/bin/bash
#
# Script to start docker and update the /etc/hosts file to point to
# the hbase-docker container
#
# the hbase and zookeeper data and logs are written to container
# /data subdirs which are connected to local directory 'data'.
#

echo "Starting HBase container"
mkdir -p data

id=$(docker run -d -h hbase-docker -v $PWD/data:/data -p 2181:2181 -p 8080:8080 -p 9090:9090 -p 9095:9095 -p 16010:16010 --name hbase dajobe/hbase)
# id=$(docker run -d -v $PWD/data:/data -p :2181 -p :9090 -p :16000 -p :16010 -p :16020 -p :16030 --name hbase dajobe/hbase)

echo "Container has ID $id"

# Get the hostname and IP inside the container
docker_hostname=`docker inspect -f '{{.Config.Hostname}}' $id`
docker_ip=`docker inspect -f '{{.NetworkSettings.IPAddress}}' $id`

echo "Updating /etc/hosts to make hbase-docker point to $docker_ip ($docker_hostname)"
if grep 'hbase-docker' /etc/hosts >/dev/null; then
  sudo sh -c "sed -i '' 's/^.*hbase-docker.*\$/$docker_ip hbase-docker $docker_hostname/' /etc/hosts"
else
  sudo sh -c "echo '$docker_ip hbase-docker $docker_hostname' >> /etc/hosts"
fi

echo "Now connect to hbase at localhost on the standard ports"
echo "  ZK 2181, Thrift 9090, Master 16000, Region 16020"
echo "Or connect to host hbase-docker (in the container) on the same ports"
echo ""
echo "Hbase master, thrift server and other logs are in data/logs/"
echo ""
echo "For docker status:"
echo "$ id=$id"
echo "$ docker ps \$id"
