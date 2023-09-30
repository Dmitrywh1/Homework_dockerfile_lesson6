FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install git -y
RUN mkdir /home/firstdockerfile
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/firstdockerfile
RUN cd /home/firstdockerfile/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /home/firstdockerfile/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]
EXPOSE 8080

