#!/bin/bash

docker run -d -p 58117:58117 -p 58118:58118 -p 58119:58119 --name sscluster -v $PWD/conf:/etc/sscluster -i vmlinz/shadowsocks-docker supervisord -n -c /etc/sscluster/supervisor-proxy.conf
