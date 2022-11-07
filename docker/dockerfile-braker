FROM continuumio/miniconda3:4.12.0

ARG VERSION

RUN apt-get update -qq \
  && apt-get -qq -y install git libyaml-perl

RUN cd /usr/local/bin \
  && git clone https://github.com/Gaius-Augustus/BRAKER.git \
  && cd BRAKER \
  && git checkout v$VERSION

COPY environment.yml /
RUN conda env update --quiet -n base -f environment.yml && conda clean -a

RUN cd /usr/local/bin \
  && git clone https://github.com/gatech-genemark/ProtHint.git \
  && cd ProtHint \
  && git checkout v2.6.0

RUN cd /usr/bin \
  && mv perl perl.old \
  && ln -s /opt/conda/bin/perl

RUN conda install -y openjdk=8

RUN cd /usr/local/bin \
  && git clone https://github.com/Gaius-Augustus/GUSHR.git \
  && cd GUSHR \
  && git checkout ee26d5c

RUN cd /usr/local/bin \
  && git clone https://github.com/Gaius-Augustus/TSEBRA.git \
  && cd TSEBRA \
  && git checkout v1.0.3

ENV PATH="${PATH}:/opt/conda/bin:/usr/local/bin/GUSHR:/usr/local/bin/TSEBRA/bin:/usr/local/bin/BRAKER/scripts:/usr/local/bin/ProtHint/bin"
ENV PYTHON3_PATH=/opt/conda/bin
ENV BAMTOOLS_PATH=/opt/conda/bin
ENV SAMTOOLS_PATH=/opt/conda/bin
ENV DIAMOND_PATH=/opt/conda/bin
ENV CDBTOOLS_PATH=/opt/conda/bin
ENV PROTHINT_PATH=/usr/local/bin/ProtHint/bin
ENV GUSHR_PATH=/usr/local/bin/GUSHR
ENV JAVA_PATH=/opt/conda/bin
ENV TSEBRA_PATH=/usr/local/bin/TSEBRA/bin
