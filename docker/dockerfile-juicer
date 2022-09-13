FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

ARG VERSION

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt-get -qq -y install tzdata coreutils default-jre nvidia-headless-515 wget

RUN cd /usr/local/bin \
  && mkdir juicer \
  && cd juicer \
  && wget https://s3.amazonaws.com/hicfiles.tc4ga.com/public/juicer/juicer_tools_${VERSION}.jar

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

COPY environment.yml /
RUN conda env update --quiet -n base -f /environment.yml && conda clean -a
