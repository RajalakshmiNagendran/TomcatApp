FROM centos

MAINTAINER nagudivyas@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.84/bin/apache-tomcat-8.5.84.tar.gz
RUN tar xvzf apache*.tar.gz
RUN mv apache-tomcat-8.5.84/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8082

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
