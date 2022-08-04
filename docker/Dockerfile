FROM continuumio/miniconda3:4.12.0

# Install the actg-wgaa-base environment
COPY environments/base.environment.yml /
COPY environments/braker.environment.yml /
COPY environments/busco.environment.yml /
COPY environments/edta.environment.yml /

RUN conda env create --quiet -f /base.environment.yml && conda clean -a
RUN conda env create --quiet -f /braker.environment.yml && conda clean -a
RUN conda env create --quiet -f /edta.environment.yml && conda clean -a
RUN conda env create --quiet -f /busco.environment.yml && conda clean -a

# Installs hic_qc from the main branch dated Jun 27th 2022
# as the v1.0 seems too old and there are no other releases in bioconda.
RUN git clone https://github.com/phasegenomics/hic_qc.git \
  && cd hic_qc \
  && git checkout 6881c33 \
  && conda env create -n hic_qc --file env.yml \
  && . /root/.bashrc \
  && conda activate hic_qc \
  && python setup.py install --user \
  && conda clean -a
