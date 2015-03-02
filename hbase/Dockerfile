# HBase in Docker

FROM dajobe/java

MAINTAINER Dave Beckett <dave@dajobe.org>

ENV HBASE_VERSION 1.0.0

# Download and Install HBase
RUN mkdir -p /opt \
    && curl -SsfL "http://archive.apache.org/dist/hbase/hbase-$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz" | tar -x -C /opt -z -f - \
    && mv /opt/hbase-$HBASE_VERSION /opt/hbase \
    && rm -rf /tmp/hbase.tar.gz

ENV HBASE_SERVER /opt/hbase/bin/hbase

COPY conf/* /opt/hbase/conf/

COPY ./hbase-server /opt/hbase-server


VOLUME /data

# REST API
EXPOSE 8080
# Thrift API
EXPOSE 9090
# Thrift Web UI
EXPOSE 9095
# HBase's zookeeper - used to find servers
EXPOSE 2181
# HBase Master web UI at :16010/master-status;  ZK at :16010/zk.jsp
EXPOSE 16010

CMD ["/opt/hbase-server"]
