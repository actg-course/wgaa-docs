FROM continuumio/miniconda3:4.12.0

COPY environment.yml /
RUN conda env update --quiet -n base -f environment.yml && conda clean -a

# BCBio is not compatible with conda-forge packages
# installed via the enviroment. So install it instead using pip
RUN pip3 install bcbio-gff==0.7.0
RUN pip3 install pysam==0.21.0