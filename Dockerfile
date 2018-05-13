FROM fanningert/baseimage-alpine

MAINTAINER fanningert <thomas@fanninger.at>

RUN apk update
RUN apk add --no-cache --update bash
RUN apk add --no-cache --update build-base libressl libressl2.7-libcrypto libressl2.7-libssl libressl2.7-libtls
RUN apk add --no-cache --update ncurses libxml2 scanelf gmp jq libfastjson
RUN apk add --no-cache --update ocaml ocaml-camlp4 ocaml-findlib
RUN apk add --no-cache --update git

RUN mkdir -p /geneweb
RUN git clone https://github.com/geneweb/geneweb /geneweb
RUN cd /geneweb
RUN ./configure && make opt && make distrib

ADD root/ /

RUN chmod -v +x /etc/services.d/*/run /etc/cont-init.d/*
