FROM continuumio/miniconda3:4.12.0

COPY environment.yml /
RUN conda env update --quiet -n base -f environment.yml && conda clean -a
