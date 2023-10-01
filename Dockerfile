FROM ubuntu:18.04
RUN apt-get update && apt-get install -y wget
RUN apt install maven -y
RUN apt install openjdk-11-jdk -y
RUN apt install git -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz
RUN tar -zxvf apache-tomcat-9.0.80.tar.gz
RUN mv apache-tomcat-9.0.80 /opt/tomcat
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN git clone https://github.com/yankils/hello-world.git
RUN cd hello-world/ && mvn package
RUN cp hello-world/webapp/target/webapp.war /opt/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]