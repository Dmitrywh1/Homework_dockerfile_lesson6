FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y maven tomcat9 default-jdk git && \
    git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    cd boxfuse-sample-java-war-hello && \
    mvn package && \
    cp target/hello-1.0.war /var/lib/tomcat9/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

