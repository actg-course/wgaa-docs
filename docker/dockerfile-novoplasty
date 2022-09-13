FROM continuumio/miniconda3:4.12.0

ARG VERSION

RUN apt-get update -qq \
  && apt-get -qq -y install git

RUN cd /usr/local/bin \
  && git clone https://github.com/ndierckx/NOVOPlasty.git \
  && cd NOVOPlasty \
  && git checkout NOVOPlasty$VERSION \
  && chmod 755 NOVOPlasty$VERSION.pl

ENV PATH="${PATH}:/usr/local/bin/NOVOPlasty"
