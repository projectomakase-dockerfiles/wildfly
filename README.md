# WildFly Docker Image #

This repository contains the Dockerfile and resources for creating a Wildfly instance running on Oracle Server JRE 8.

### Image ###

The image **extends** the `projectomakase/server-jre-8:latest` image and adds Wildfly 9.0.2.Final

### Availability ###

The Dockerfile is available in the master branch and is built in the Docker HUB as `projectomakase/wildfly:latest`.

### Usage ###

To boot in standalone mode

    docker run -d projectomakase/wildfly

### Environment Variables ###

The image supports the following environment variables:

### `ADMIN_USER`

If provided will create a wildfly managerment user with the given user name, ADMIN_PASSWORD is also required for this to work. This is required to access the Wildfly and Hawt.io management console.

### `ADMIN_PASSWORD`

If provided will create a wildfly managerment user with the given password, ADMIN_USER is also required for this to work. This is required to access the Wildfly and Hawt.io management console.
