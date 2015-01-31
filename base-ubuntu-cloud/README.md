# Base from Ubuntu Core #

## Build ##

    $ curl -O -L https://partner-images.canonical.com/core/releases/precise/release/ubuntu-precise-core-cloudimg-amd64-root.tar.gz
    $ docker build -t dajobe/base-uc .

Note: have to use `ADD`; cannot use `RUN` like this

    RUN curl https://partner-images.canonical.com/core/releases/precise/release/ubuntu-precise-core-cloudimg-amd64-root.tar.gz | tar -x -C / -p -z -f -

since there is no shell in the container at the time to run that pipeline.


## Use ##

    $ docker run -it --rm dajobe/base-uc

