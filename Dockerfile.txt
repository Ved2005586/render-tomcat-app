FROM tomcat:10.1-jdk17

# Remove Tomcat's default webapps so only our app is served
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy our app, served at /thjune26_p4_name_app/
COPY webapps/thjune26_p4_name_app /usr/local/tomcat/webapps/thjune26_p4_name_app

# Copy startup script that rewrites the port for Render
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]