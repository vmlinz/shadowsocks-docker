#!/bin/bash

docker run -d -P --name sscluster -v $PWD/conf:/etc/sscluster -i vmlinz/shadowsocks-docker supervisord -n -c /etc/sscluster/supervisor-proxy.conf
