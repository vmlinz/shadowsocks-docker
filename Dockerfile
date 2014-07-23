# Ladder inside of Docker based on Ubuntu 14.04 LTS.
# version 0.0.1

# Start with Ubuntu 14.04 LTS.
FROM phusion/baseimage

MAINTAINER Zaicheng Qi <vmlinz@gmail.com>

# Update system
# Install haproxy from ubuntu ppa
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common unzip
RUN add-apt-repository -y ppa:vbernat/haproxy-1.5
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y haproxy
RUN sed -i -e 's/ENABLED=0/ENABLED=1/' /etc/default/haproxy

# Install shadowsocks python implementation
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip python-m2crypto
RUN pip install shadowsocks

# Install supervisor
RUN pip install supervisor

#VOLUME ["/etc/haproxy"]
#VOLUME ["/etc/supervisor/conf.d"]
#VOLUME ["/etc/shadowsocks.d"]

ADD conf/supervisor-proxy.conf /etc/supervisor/conf.d/supervisor-proxy.conf
ADD conf/haproxy.cfg /etc/haproxy/haproxy.cfg
ADD conf/shadowsocks /etc/shadowsocks.d
ADD conf/cowrc /etc/cowrc

RUN mkdir -p /opt/cow
WORKDIR /opt/cow

# Install cow binary from gobuild.io
RUN curl -L http://gobuild.io/github.com/cyfdecyf/cow/master/linux/amd64 -o output.zip
RUN unzip output.zip
RUN rm output.zip

RUN apt-get -y clean

EXPOSE 58117
EXPOSE 58118
EXPOSE 58119

CMD ["supervisord", "-n"]
