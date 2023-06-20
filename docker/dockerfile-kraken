FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

ARG VERSION

RUN apt-get -qq update && apt-get -qq -y install \
    wget build-essential zlib1g

RUN apt-get -qq -y install libghc-zlib-dev 

RUN wget https://github.com/DerrickWood/kraken2/archive/refs/tags/v$VERSION.tar.gz \
    && tar -zxvf v$VERSION.tar.gz \
    && cd kraken2-$VERSION/ \
    && sh install_kraken2.sh /usr/local/kraken2

RUN apt-get -qq -y install rsync

ENV PATH="${PATH}:/usr/local/kraken2"
