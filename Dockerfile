FROM debian:stretch

MAINTAINER IPFN Developers <dev@ipfn.io>

RUN apt-get update -qy
RUN apt-get install -qy git

ARG DEVENV_REVISION
ADD ./devenv /opt/gopath/src/github.com/ipfn/ipfn/devenv
RUN bash /opt/gopath/src/github.com/ipfn/ipfn/devenv/setup.sh
RUN rm -rf /opt/gopath/src/github.com/ipfn/ipfn
VOLUME /opt/gopath/src/github.com/ipfn/ipfn
WORKDIR /opt/gopath/src/github.com/ipfn/ipfn

EXPOSE 2348
EXPOSE 2380
EXPOSE 3147
EXPOSE 3333
