#!/bin/sh

docker build --network=host -t nordvpn-privoxy -f ./Dockerfile .

