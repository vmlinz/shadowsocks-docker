# shadowsocks in docker #

Haproxy and pen balanced shadowsocks servers in docker

Derived from [ladder](https://github.com/missdeer/ladder.git)

Tested on ubuntu 14.04 amd64

## How to use ##

* Install docker on your system, please refer to the docker official site for installing docker on your os

* fetch the docker image for docker hub

`git clone https://github.com/vmlinz/shadowsocks-docker`

`bash run.sh`

## Notes ##

* Default publish 58117, 58118 and 58119 ports, and can accept any connection from any ip.

** 58117: socks proxy
** 58118: http/https proxy
** 58119: google compress proxy

* Use the proxy auto config file sscluster.pac, which is borrowed from ladder project. It's generated from [gfwlist2pac](https://github.com/clowwindy/gfwlist2pac). Find a proper extension which supports pac file, ie, SwitchySharp for Chrome.

* Don't spread the public shadowsocks configuration files. And you'd better use your own shadowsocks account if possible.

## Issues ##

* Don't know how to control the process start up sequence so that I can ensure haproxy starts after all shadowsocks are ready. Because of this I cannot use haproxy to load balance shadowsocks connections, I use pen instead. If you have any ideas please feel free to fork and send pull request.
