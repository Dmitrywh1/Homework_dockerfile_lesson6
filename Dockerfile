FROM tomcat
RUN apt update
RUN apt install maven -y
RUN apt install openjdk-11-jdk -y
RUN apt install git -y
RUN git clone https://github.com/yankils/hello-world.git
RUN cd hello-world/ && mvn package
RUN cp hello-world/webapp/target/webapp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

