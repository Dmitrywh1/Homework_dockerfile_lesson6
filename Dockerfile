FROM tomcat
RUN apt update
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install openjdk-11-jdk -y
RUN apt install git -y
RUN mkdir /home/firstdockerfile
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /boxfuse-sample-java-war-hello && mvn package
RUN cp /home/Hello/target/hello-1.0.war /var/lib/tomcat9/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]

