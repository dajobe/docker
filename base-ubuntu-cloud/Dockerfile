FROM scratch

ADD ubuntu-precise-core-cloudimg-amd64-root.tar.gz /

MAINTAINER Dave Beckett <dave@dajobe.org>

ENV HOME /root

COPY *.sh /build/

RUN /build/prepare.sh \
    && /build/clean.sh

CMD [ "/bin/bash" ]
