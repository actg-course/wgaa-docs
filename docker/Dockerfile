FROM continuumio/miniconda3:4.12.0

LABEL authors="Stephen Ficklin, Huiting Zhang, Alex Harkess" \
      description="Docker image for the American Campus Tree Genomes project"

# Install the actg-wgaa-base environment
COPY environments/base.environment.yml /
COPY environments/braker.environment.yml /
COPY environments/busco.environment.yml /
COPY environments/edta.environment.yml /
COPY environments/hic_qc.environment.yml /
RUN conda env create --quiet -f /base.environment.yml && conda clean -a
RUN conda env create --quiet -f /braker.environment.yml && conda clean -a
RUN conda env create --quiet -f /edta.environment.yml && conda clean -a
RUN conda env create --quiet -f /busco.environment.yml && conda clean -a
RUN conda env create --quiet -f /hic_qc.environment.yml && conda clean -a
