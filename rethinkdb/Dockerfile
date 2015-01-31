FROM dajobe/base

MAINTAINER Dave Beckett <dave@dajobe.org>

COPY *.sh /build/

RUN /build/prepare-rethinkdb.sh \
    && /build/cleanup-rethinkdb.sh

# Mountable data directory
VOLUME ["/data"]

WORKDIR /data

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015

CMD ["rethinkdb", "--bind", "all"]
