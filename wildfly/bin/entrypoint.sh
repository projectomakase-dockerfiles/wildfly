#!/bin/bash

if [[ ! -z "${ADMIN_USER}" ]] && [[ ! -z "${ADMIN_PASSWORD}" ]]
then
    ${JBOSS_HOME}/bin/add-user.sh --silent -e -u ${ADMIN_USER} -p ${ADMIN_PASSWORD}
fi

exec "$@"