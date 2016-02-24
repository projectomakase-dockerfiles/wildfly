FROM projectomakase/server-jre-8:latest

MAINTAINER Richard Lucas <feedback@projectomakase.org>

ENV WILDFLY_VERSION 9.0.2.Final

ENV JBOSS_HOME /opt/wildfly

EXPOSE 8080 9990

USER root

RUN mkdir /opt/wildfly && chown omakase:omakase /opt/wildfly

USER omakase

#Install Wildfly
RUN \
    curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx && \
    cp -rf wildfly-$WILDFLY_VERSION/* $JBOSS_HOME/ && \
    rm -rf wildfly-$WILDFLY_VERSION

COPY wildfly/bin/standalone-docker.sh ${JBOSS_HOME}/bin/
COPY wildfly/bin/entrypoint.sh ${JBOSS_HOME}/bin/entrypoint.sh

USER root

RUN \
        chown -Rf omakase:omakase ${JBOSS_HOME}/bin/standalone-docker.sh && \
		chown -Rf omakase:omakase ${JBOSS_HOME}/bin/entrypoint.sh && \
		chmod +x ${JBOSS_HOME}/bin/standalone-docker.sh

USER omakase

ENTRYPOINT ["/opt/wildfly/bin/entrypoint.sh"]

CMD ["/opt/wildfly/bin/standalone-docker.sh", "-c", "standalone.xml"]
