# Saiku #

Docker build for [Saiku Analytics](https://github.com/OSBI/saiku)

## Build ##

    $ docker build -t dajobe/saiku .

## Use ##

Run it detached and export all ports (8080) to host.

    $ docker run -d -p 8080:8080 --name saiku dajobe/saiku

## Web UI ##

Wait for it to start - a couple of minutes and
access via web UI with user `admin` and password `admin`.

On OSX with boot2docker

    $ ip=`boot2docker ip`
    $ open http://$ip:8080
