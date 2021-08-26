FROM ubuntu:20.04
LABEL maintainer="dalmatialab"

# Java installation
RUN apt-get update && apt-get install -y openjdk-8-jdk wget
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

# Environment variables
ENV HADOOP_VERSION 3.3.0
ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop
ENV HADOOP_PREFIX=/opt/hadoop

# Adding on path
ENV PATH $HADOOP_HOME/bin:$PATH
ENV PATH $JAVA_HOME/bin:$PATH

# Hadoop installation
RUN mkdir -p /opt/hadoop
RUN cd /opt/hadoop && wget https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz \
                   && tar -xvzf hadoop-$HADOOP_VERSION.tar.gz --strip-components 1 \
                   && rm hadoop-$HADOOP_VERSION.tar.gz

# HDFS data volumes
ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data

# Running scripts
ADD src/run.sh $HADOOP_HOME/bin/run.sh
RUN chmod a+x $HADOOP_HOME/bin/run.sh

CMD ["sh","-c","run.sh"]
