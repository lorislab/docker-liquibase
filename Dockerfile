FROM jboss/base-jdk:11

ENV LIQUIBASE_VERSION 3.6.2

# Download the liquibase
ADD https://github.com/liquibase/liquibase/releases/download/liquibase-parent-${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}-bin.tar.gz /opt/liquibase/

USER root

# Install the liquibase
RUN mkdir /opt/database
RUN cd /opt/liquibase/ \
	&& tar -xzf liquibase-*-bin.tar.gz \
    && cp /opt/liquibase/sdk/lib-sdk/slf4j-api-*.jar /opt/liquibase/lib \
    && rm -rf /opt/liquibase/sdk
    
