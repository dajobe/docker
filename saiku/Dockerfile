FROM dajobe/java

MAINTAINER Dave Beckett <dave@dajobe.org>

WORKDIR /usr/src

# curl in image is better than ADD <url>
RUN curl -L -o saiku.tar.gz \
      http://meteorite.bi/downloads/saiku-server-3.0.8.tar.gz \
  && tar xfz saiku.tar.gz \
  && rm -f saiku.tar.gz

EXPOSE 8080

CMD /usr/src/saiku-server/start-saiku.sh \
    && tail -f /usr/src/saiku-server/tomcat/logs/catalina.out
