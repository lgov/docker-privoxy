#!/usr/bin/env bash

NORDVPN_SERVICE="nordvpn_nordvpn_1"
SVC_HEALTHY=`docker ps | grep $NORDVPN_SERVICE | grep "(unhealthy)" | wc -l`

if [[ $SVC_HEALTHY -eq 1 ]]
then
    echo "Nordvpn unhealthy, retarting the service and the proxy"
    docker stop nordvpn_nordvpn-privoxy_1
    docker restart $NORDVPN_SERVICE
    docker start nordvpn_nordvpn-privoxy_1
fi

