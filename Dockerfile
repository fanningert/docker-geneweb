FROM fanningert/baseimage-alpine

MAINTAINER fanningert <thomas@fanninger.at>

RUN apk update && \
	apk add --no-cache --update bash && \
        apk add --no-cache --update build-base libressl libressl2.7-libcrypto libressl2.7-libssl libressl2.7-libtls ncurses libxml2 scanelf gmp jq libfastjson && \
	apk add --no-cache --update ocaml ocaml-camlp4 ocaml-findlib && \
        apk add --no-cache --update git

RUN mkdir -p /geneweb
RUN git clone https://github.com/geneweb/geneweb /geneweb
RUN cd /geneweb
RUN ./configure && make opt && make distrib

ADD root/ /

RUN chmod -v +x /etc/services.d/*/run /etc/cont-init.d/*
