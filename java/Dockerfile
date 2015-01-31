FROM dajobe/base

MAINTAINER Dave Beckett <dave@dajobe.org>

COPY *.sh /build/

RUN /build/prepare-java.sh \
    && /build/cleanup-java.sh

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

CMD [ "/bin/bash" ]
