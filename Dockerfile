# Define the environment
FROM ubuntu

MAINTAINER Rucha rucha@indix.com

# Define environment variables
ENV SHARE /usr/local/share
ENV SCALA_HOME $SHARE/scala
ENV JAVA_HOME $SHARE/java
ENV PATH=$SCALA_HOME/bin:$JAVA_HOME/bin:$PATH

# Move over JDK and Scala
#ADD jdk1.8.0_111.tar.gz /
#ADD scala-2.12.0-M1.tgz /

# Get JDK and Scala into place
#RUN mv /jdk1.8.0_111 $JAVA_HOME
#RUN mv /scala-2.12.0-M1 $SCALA_HOME

CMD ["/bin/bash"]