FROM continuumio/miniconda3:4.12.0

ARG VERSION

RUN apt-get update -qq \
  && apt-get -qq -y install git

RUN cd /usr/local/bin \
  && git clone https://github.com/phasegenomics/hic_qc.git \
  && cd hic_qc \
  && git checkout $VERSION \
  && . /root/.bashrc \
  && conda init bash \
  && conda env create -n hic_qc --file env.yml \
  && conda activate hic_qc \
  && python setup.py install --user \
  && conda clean -a

ENV PATH="${PATH}:/usr/local/bin/hic_qc"
