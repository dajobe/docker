FROM debian:jessie

MAINTAINER Dave Beckett <dave@dajobe.org>

ENV HOME /root

COPY *.sh /build/

RUN /build/prepare-base.sh \
    && /build/cleanup-base.sh

CMD [ "/bin/bash" ]
