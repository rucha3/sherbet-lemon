# Define the environment
FROM ubuntu

MAINTAINER Rucha rucha@indix.com

RUN apt-get update && apt-get install -y \
    openjdk-8-jre \
    openjdk-8-jdk

ADD target/scala-**/sherbet-lemon-assembly-0.1.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
# Move over JDK and Scala
#ADD jdk1.8.0_111.tar.gz /
#ADD scala-2.12.0-M1.tgz /

# Get JDK and Scala into place
#RUN mv /jdk1.8.0_111 $JAVA_HOME
#RUN mv /scala-2.12.0-M1 $SCALA_HOME

#CMD ["/bin/bash"]