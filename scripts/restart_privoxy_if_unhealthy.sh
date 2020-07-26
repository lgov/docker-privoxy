#!/usr/bin/env bash

NORDVPN_SERVICE="nordvpn_nordvpn_1"
SVC_HEALTHY=`docker ps | grep NORDVPN_SERVICE | grep "(healthy)" | wc -l`

if [[ SVC_HEALTHY -eq 0 ]]
then
    echo "Nordvpn unhealthy, retarting the service and the proxy"
    docker service update --force NORDVPN_SERVICE
    docker stop nordvpn_nordvpn-privoxy_1
    docker restart nordvpn_nordvpn_1
    docker start nordvpn_nordvpn-privoxy_1
fi

