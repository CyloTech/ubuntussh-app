#!/bin/bash -e
set -x

if [ ! -f /etc/app_configured ]; then
    echo "root:${ROOT_PASSWORD}" | chpasswd

    #Tell Apex we're done installing.
    curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST "https://api.cylo.io/v1/apps/installed/$INSTANCE_ID"
fi

exec "$@"