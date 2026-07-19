FROM tomcat:10.1-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY webapps/thjune26_p4_name_app /usr/local/tomcat/webapps/thjune26_p4_name_app

EXPOSE 8080

CMD ["catalina.sh", "run"]