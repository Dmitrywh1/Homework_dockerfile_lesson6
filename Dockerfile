FROM tomcat
RUN apt update
RUN apt install tomcat9 -y
RUN apt install maven default-jdk -y
RUN apt install default-jdk -y
RUN apt install git -y
RUN mkdir /home/firstdockerfile
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/Hello
RUN cd /home/Hello && mvn package
RUN cp /home/Hello/target/hello-1.0.war /var/lib/tomcat9/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]

