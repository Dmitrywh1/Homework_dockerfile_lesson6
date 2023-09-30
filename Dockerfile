FROM tomcat
RUN apt update
RUN apt install maven default-jdk -y
RUN apt install default-jdk -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat9/webapps/

EXPOSE 8080

CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]

