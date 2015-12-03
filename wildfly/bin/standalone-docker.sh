#!/bin/bash
if [[ -z "${IPADDR}" ]]
then
   IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')
fi
export JAVA_OPTS="-Xms256m -Xmx512m -XX:MaxMetaspaceSize=256M -Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR -Djboss.node.name=server-$IPADDR $JAVA_OPTS"
`dirname $0`/standalone.sh $@