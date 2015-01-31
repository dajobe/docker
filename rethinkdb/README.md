# RethinkDB #

Docker build for [RethinkDB](http://www.rethinkdb.com/)

## Build ##

    $ docker build -t dajobe/rethinkdb .

## Use ##

Run it detached and export all ports (8080, 28015, 29015) to host.

	$ mkdir -p data
	$ docker run -d -p 8080:8080 -p 28015:28015 -p 29015:29015 -v $PWD/data:/data --name rethinkdb dajobe/rethinkdb

## Web UI ##

On OSX with boot2docker

    $ ip=`boot2docker ip`
    $ open http://$ip:8080
