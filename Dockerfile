FROM jboss/wildfly:20.0.0.Final

COPY ./target/my-app.war /opt/jboss/wildfly/standalone/deployments/


EXPOSE 8088


CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]


