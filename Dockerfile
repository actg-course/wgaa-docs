FROM continuumio/miniconda3:4.12.0

LABEL authors="Stephen Ficklin, Huiting Zhang, Alex Harkess" \
      description="Docker image for the American Campus Tree Genomes project"

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet -f /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/actg-assembly-0.1/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name actg-assembly-0.1 > actg-assembly-0.1.yml
