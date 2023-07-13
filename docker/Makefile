FASTQC_VERSION=0.11.9
FASTP_VERSION=0.23.2
R_BASE_VERSION=4.1.3
MULTIQC_VERSION=1.13a
SRA_TOOLS_VERSION=2.11.0
FASTP_VERSION=0.23.2
SAMTOOLS_VERSION=1.15.1
BWA_VERSION=0.7.17
JELLYFISH_VERSION=2.2.10
HIFIASM_VERSION=0.16.1
MUMMER_VERSION=3.23
BEDTOOLS_VERSION=2.30.0
REPEATMASKER_VERSION=4.1.2.p1
YAHS_VERSION=1.2a.2-0
HIC_QC_VERSION=6881c33
NOVOPLASTY_VERSION=4.3.1
BUSCO_VERSION=5.4.3-0
BRAKER_VERSION=2.1.6
EDTA_VERSION=2.0.1
JUICER_VERSION=1.22.01
MITOHIFI_VERSION=2.2
EMBOSS_VERSION=6.6.0
PASA_VERSION=2.5.2
STAR_VERSION=2.7.10a
TRINITY_VERSION=2.13.2
BLAST_VERSION=2.14.0
KRAKEN_VERSION=2.1.3
BIOPYTHON_VERSION=1.81

all: build-all
build-all: fastqc-build r-base-build sra-tools-build fastp-build \
	samtools-build bwa-build jellyfish-build hifiasm-build mummer-build \
	bedtools-build repeatmasker-build yahs-build multiqc-build \
	hic_qc-build novoplasty-build busco-build braker-build \
	edta-build juicer-build emboss-build pasa-build trinity-build \
	blast-build kraken-build python
push-all: fastqc-push r-base-push sra-tools-push fastp-push \
	samtools-push bwa-push jellyfish-push hifiasm-push mummer-push \
	bedtools-push repeatmasker-push yahs-push multiqc-push \
	hic_qc-push novoplasty-push busco-push braker-push \
	edta-push juicer-push emboss-push pasa-push trinity-push \
	blast-push kraken-push biopython-push
test-all: fastqc-test r-base-test sra-tools-test fastp-test \
	samtools-test bwa-test jellyfish-test hifiasm-test mummer-test \
	bedtools-test repeatmasker-test yahs-test multiqc-test \
	hic_qc-test novoplasty-test busco-test braker-test \
	edta-test juicer-test emboss-test pasa-test trinity-test \
	blast-test kraken-test biopython-test

#
# Python
biopython: biopython-build
biopython-build:
	mkdir -p build/biopython; \
	cd build/biopython; \
	cp ../../dockerfile-biopython ./Dockerfile; \
	cp ../../environment_biopython.yml environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-biopython:$(BIOPYTHON_VERSION) .

biopython-push: biopython-build
	cd build/biopython; \
	docker push systemsgenetics/actg-wgaa-biopython:$(BIOPYTHON_VERSION)

biopython-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-biopython:$(BIOPYTHON_VERSION) python3 -c "from importlib.metadata import version; print(version('biopython'))"

biopython-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-biopython:$(BIOPYTHON_VERSION) /bin/bash


#
# Kraken
#
kraken: kraken-build

kraken-build:
	mkdir -p build/kraken; \
	cd build/kraken; \
    cp ../../dockerfile-kraken ./Dockerfile; \
	docker build --build-arg VERSION=${KRAKEN_VERSION} -t systemsgenetics/actg-wgaa-kraken:$(KRAKEN_VERSION) .

kraken-push: kraken-build
	cd build/kraken; \
	docker push systemsgenetics/actg-wgaa-kraken:$(KRAKEN_VERSION)

kraken-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-kraken:$(KRAKEN_VERSION) \
	  kraken2 -version

kraken-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-kraken:$(KRAKEN_VERSION) /bin/bash


#
# Blast+
#
blast: blast-build

blast-build:
	mkdir -p build/blast; \
	cd build/blast; \
    cp ../../dockerfile-blast ./Dockerfile; \
	docker build --build-arg VERSION=${BLAST_VERSION} -t systemsgenetics/actg-wgaa-blast:$(BLAST_VERSION) .

blast-push: blast-build
	cd build/blast; \
	docker push systemsgenetics/actg-wgaa-blast:$(BLAST_VERSION)

blast-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-blast:$(BLAST_VERSION) \
	  blastn -version

blast-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-blast:$(BLAST_VERSION) /bin/bash


#
# Trinity
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
# Builds by copying a custom Dockerfile and passes in the version as an environment variable
trinity: trinity-build
trinity-build:
	mkdir -p build/trinity; \
	cd build/trinity; \
	cp ../../dockerfile-trinity ./Dockerfile; \
	docker build --build-arg VERSION=${TRINITY_VERSION} -t systemsgenetics/actg-wgaa-trinity:$(TRINITY_VERSION) .

trinity-push: trinity-build
	cd build/trinity; \
	docker push systemsgenetics/actg-wgaa-trinity:$(TRINITY_VERSION)

trinity-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-trinity:$(TRINITY_VERSION) Trinity --version | head -n 1

trinity-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-trinity:$(TRINITY_VERSION) /bin/bash


#
# PASA
# Builds by using a custom Dockerfile
pasa: pasa-build
pasa-build:
	mkdir -p build/pasa; \
	cd build/pasa; \
	cp ../../dockerfile-pasa ./Dockerfile; \
	cp ../../pasa-conf.txt ./conf.txt; \
	docker build --build-arg VERSION=${PASA_VERSION} -t systemsgenetics/actg-wgaa-pasa:$(PASA_VERSION) .

pasa-push: pasa-build
	cd build/pasa; \
	docker push systemsgenetics/actg-wgaa-pasa:$(PASA_VERSION)

pasa-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-pasa:$(PASA_VERSION) Launch_PASA_pipeline.pl --version

pasa-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-pasa:$(PASA_VERSION) /bin/bash


#
# star
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
star: star-build
star-build:
	mkdir -p build/star; \
	cd build/star; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::star=$(STAR_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-star:$(STAR_VERSION) .

star-push: star-build
	cd build/star; \
	docker push systemsgenetics/actg-wgaa-star:$(STAR_VERSION)

star-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-star:$(STAR_VERSION) STAR --version

star-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-star:$(STAR_VERSION) /bin/bash



#
# MitoHiFi
#
mitohifi: mitohifi-build

mitohifi-build:
	mkdir -p build/mitohifi; \
	cd build/mitohifi; \
	git clone https://github.com/marcelauliano/MitoHiFi.git; \
	cd MitoHiFi; \
	git checkout v2.2; \
	docker build -t systemsgenetics/actg-wgaa-mitohifi:$(MITOHIFI_VERSION) .


mitohifi-push: mitohifi-build
	cd build/mitohifi; \
	docker push systemsgenetics/actg-wgaa-mitohifi:$(MITOHIFI_VERSION)

mitohifi-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-mitohifi:$(MITOHIFI_VERSION) \
	  mitohifi.py --version

mitohifi-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-mitohifi:$(MITOHIFI_VERSION) /bin/bash


#
# Juicer
# Builds by creating a custom environment YML file and a custom conda Dockerfile
juicer: juicer-build
juicer-build:
	mkdir -p build/juicer; \
	cd build/juicer; \
	cp ../../dockerfile-juicer ./Dockerfile; \
	cp ../../environment_juicer.yml environment.yml; \
	docker build --build-arg VERSION=${JUICER_VERSION} -t systemsgenetics/actg-wgaa-juicer:$(JUICER_VERSION) .

juicer-push: juicer-build
	cd build/juicer; \
	docker push systemsgenetics/actg-wgaa-juicer:$(JUICER_VERSION)

juicer-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-juicer:$(JUICER_VERSION) \
	  java -Xmx32G -jar /usr/local/bin/juicer/juicer_tools_$(JUICER_VERSION).jar --version | grep Version

juicer-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-juicer:$(JUICER_VERSION) /bin/bash


#
# EDTA
# Builds by copying a custom Dockerfile and passes in the version as an environment variable
edta: edta-build
edta-build:
	mkdir -p build/edta; \
	cd build/edta; \
	cp ../../dockerfile-edta ./Dockerfile; \
	docker build --build-arg VERSION=${EDTA_VERSION} -t systemsgenetics/actg-wgaa-edta:$(EDTA_VERSION) .

edta-push: edta-build
	cd build/edta; \
	docker push systemsgenetics/actg-wgaa-edta:$(EDTA_VERSION)

edta-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-edta:$(EDTA_VERSION) EDTA.pl 2>&1 | grep \(EDTA\)

edta-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-edta:$(EDTA_VERSION) /bin/bash

#
# BRAKER
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
braker: braker-build
braker-build:
	mkdir -p build/braker; \
	cd build/braker; \
	cp ../../dockerfile-braker ./Dockerfile; \
	cp ../../environment_braker.yml environment.yml; \
	docker build --build-arg VERSION=${BRAKER_VERSION} -t systemsgenetics/actg-wgaa-braker:$(BRAKER_VERSION) .

braker-push: braker-build
	cd build/braker; \
	docker push systemsgenetics/actg-wgaa-braker:$(BRAKER_VERSION)

braker-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-braker:$(BRAKER_VERSION) braker.pl --version

braker-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-braker:$(BRAKER_VERSION) /bin/bash

#
# BUSCO
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
busco: busco-build
busco-build:
	mkdir -p build/busco; \
	cd build/busco; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::busco=$(BUSCO_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-busco:$(BUSCO_VERSION) .

busco-push: busco-build
	cd build/busco; \
	docker push systemsgenetics/actg-wgaa-busco:$(BUSCO_VERSION)

busco-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-busco:$(BUSCO_VERSION) busco

busco-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-busco:$(BUSCO_VERSION) /bin/bash

#
# NOVOplasty
# Builds by copying a custom Dockerfile and passes in the version as an environment variable
novoplasty: novoplasty-build
novoplasty-build:
	mkdir -p build/novoplasty; \
	cd build/novoplasty; \
	cp ../../dockerfile-novoplasty ./Dockerfile; \
	docker build --build-arg VERSION=${NOVOPLASTY_VERSION} -t systemsgenetics/actg-wgaa-novoplasty:$(NOVOPLASTY_VERSION) .

novoplasty-push: novoplasty-build
	cd build/novoplasty; \
	docker push systemsgenetics/actg-wgaa-novoplasty:$(NOVOPLASTY_VERSION)

novoplasty-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-novoplasty:$(NOVOPLASTY_VERSION) NOVOPlasty$(NOVOPLASTY_VERSION).pl | grep Version

novoplasty-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-novoplasty:$(NOVOPLASTY_VERSION) /bin/bash

#
# hic_qc
# Builds by copying a custom Dockerfile and passes in the version as an environment variable
hic_qc: hic_qc-build
hic_qc-build:
	mkdir -p build/hic_qc; \
	cd build/hic_qc; \
	cp ../../dockerfile-hic_qc ./Dockerfile; \
	docker build --build-arg VERSION=${HIC_QC_VERSION} -t systemsgenetics/actg-wgaa-hic_qc:$(HIC_QC_VERSION) .

hic_qc-push: hic_qc-build
	cd build/hic_qc; \
	docker push systemsgenetics/actg-wgaa-hic_qc:$(HIC_QC_VERSION)

hic_qc-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-hic_qc:$(HIC_QC_VERSION) /root/.bashrc && conda activate hic_qc && hic_qc.py --version

hic_qc-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-hic_qc:$(HIC_QC_VERSION) /bin/bash



#
# emboss
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
emboss: emboss-build
emboss-build:
	mkdir -p build/emboss; \
	cd build/emboss; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::emboss=$(EMBOSS_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-emboss:$(EMBOSS_VERSION) .

emboss-push: emboss-build
	cd build/emboss; \
	docker push systemsgenetics/actg-wgaa-emboss:$(EMBOSS_VERSION)

emboss-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-emboss:$(EMBOSS_VERSION) embossversion

emboss-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-emboss:$(EMBOSS_VERSION) /bin/bash


#
# yahs
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
yahs: yahs-build
yahs-build:
	mkdir -p build/yahs; \
	cd build/yahs; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::yahs=$(YAHS_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-yahs:$(YAHS_VERSION) .

yahs-push: yahs-build
	cd build/yahs; \
	docker push systemsgenetics/actg-wgaa-yahs:$(YAHS_VERSION)

yahs-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-yahs:$(YAHS_VERSION) yahs --version

yahs-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-yahs:$(YAHS_VERSION) /bin/bash

#
# repeatmasker
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
repeatmasker: repeatmasker-build
repeatmasker-build:
	mkdir -p build/repeatmasker; \
	cd build/repeatmasker; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::repeatmasker=$(REPEATMASKER_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-repeatmasker:$(REPEATMASKER_VERSION) .

repeatmasker-push: repeatmasker-build
	cd build/repeatmasker; \
	docker push systemsgenetics/actg-wgaa-repeatmasker:$(REPEATMASKER_VERSION)

repeatmasker-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-repeatmasker:$(REPEATMASKER_VERSION) RepeatMasker -v

repeatmasker-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-repeatmasker:$(REPEATMASKER_VERSION) /bin/bash

#
# bedtools
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
bedtools: bedtools-build
bedtools-build:
	mkdir -p build/bedtools; \
	cd build/bedtools; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::bedtools=$(BEDTOOLS_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-bedtools:$(BEDTOOLS_VERSION) .

bedtools-push: bedtools-build
	cd build/bedtools; \
	docker push systemsgenetics/actg-wgaa-bedtools:$(BEDTOOLS_VERSION)

bedtools-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-bedtools:$(BEDTOOLS_VERSION) bedtools --version

bedtools-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-bedtools:$(BEDTOOLS_VERSION) /bin/bash

#
# mummer
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
mummer: mummer-build
mummer-build:
	mkdir -p build/mummer; \
	cd build/mummer; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::mummer=$(MUMMER_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-mummer:$(MUMMER_VERSION) .

mummer-push: mummer-build
	cd build/mummer; \
	docker push systemsgenetics/actg-wgaa-mummer:$(MUMMER_VERSION)

mummer-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-mummer:$(MUMMER_VERSION) mummer | grep Usage

mummer-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-mummer:$(MUMMER_VERSION) /bin/bash

#
# hifiasm
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
hifiasm: hifiasm-build
hifiasm-build:
	mkdir -p build/hifiasm; \
	cd build/hifiasm; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::hifiasm=$(HIFIASM_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-hifiasm:$(HIFIASM_VERSION) .

hifiasm-push: hifiasm-build
	cd build/hifiasm; \
	docker push systemsgenetics/actg-wgaa-hifiasm:$(HIFIASM_VERSION)

hifiasm-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-hifiasm:$(HIFIASM_VERSION) hifiasm --version

hifiasm-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-hifiasm:$(HIFIASM_VERSION) /bin/bash

#
# Jellyfish
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
jellyfish: jellyfish-build
jellyfish-build:
	mkdir -p build/jellyfish; \
	cd build/jellyfish; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::jellyfish=$(JELLYFISH_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-jellyfish:$(JELLYFISH_VERSION) .

jellyfish-push: jellyfish-build
	cd build/jellyfish; \
	docker push systemsgenetics/actg-wgaa-jellyfish:$(JELLYFISH_VERSION)

jellyfish-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-jellyfish:$(JELLYFISH_VERSION) jellyfish --version

jellyfish-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-jellyfish:$(JELLYFISH_VERSION) /bin/bash

#
# BWA
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
bwa: bwa-build
bwa-build:
	mkdir -p build/bwa; \
	cd build/bwa; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::bwa=$(BWA_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-bwa:$(BWA_VERSION) .

bwa-push: bwa-build
	cd build/bwa; \
	docker push systemsgenetics/actg-wgaa-bwa:$(BWA_VERSION)

bwa-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-bwa:$(BWA_VERSION) bwa | grep Version

bwa-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-edta:$(BWA_VERSION) /bin/bash

#
# SAMTools
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
samtools: samtools-build
samtools-build:
	mkdir -p build/samtools; \
	cd build/samtools; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::samtools=$(SAMTOOLS_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-samtools:$(SAMTOOLS_VERSION) .

samtools-push: samtools-build
	cd build/samtools; \
	docker push systemsgenetics/actg-wgaa-samtools:$(SAMTOOLS_VERSION)

samtools-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-samtools:$(SAMTOOLS_VERSION) samtools --version-only

samtools-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-samtools:$(SAMTOOLS_VERSION) /bin/bash

#
# FastP
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
fastp: fastp-build
fastp-build:
	mkdir -p build/fastp; \
	cd build/fastp; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::fastp=$(FASTP_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-fastp:$(FASTP_VERSION) .


fastp-push: fastp-build
	cd fastp; \
	docker push systemsgenetics/actg-wgaa-fastp:$(FASTP_VERSION)

fastp-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-fastp:$(FASTP_VERSION) fastp --version

fastp-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-fastp:$(FASTP_VERSION) /bin/bash

#
# SRA Tools
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
sra-tools: sra-tools-build
sra-tools-build:
	mkdir -p build/sra-tools; \
	cd build/sra-tools; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::sra-tools=$(SRA_TOOLS_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-sra-tools:$(SRA_TOOLS_VERSION) .

sra-tools-push: sra-tools-build
	cd build/sra-tools; \
	docker push systemsgenetics/actg-wgaa-sra-tools:$(SRA_TOOLS_VERSION)

sra-tools-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-sra-tools:$(SRA_TOOLS_VERSION) fastq-dump --version | grep version

sra-tools-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-sra-tools:$(SRA_TOOLS_VERSION) /bin/bash

#
# MultiQC
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
multiqc: multiqc-build
multiqc-build:
	mkdir -p build/multiqc; \
	cd build/multiqc; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::multiqc=$(MULTIQC_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-multiqc:$(MULTIQC_VERSION) .

multiqc-push: multiqc-build
	cd build/multiqc; \
	docker push systemsgenetics/actg-wgaa-multiqc:$(MULTIQC_VERSION)

multiqc-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-multiqc:$(MULTIQC_VERSION) multiqc --version

multiqc-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-multiqc:$(MULTIQC_VERSION) /bin/bash

#
# R
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
r-base: r-base-build
r-base-build:
	mkdir -p build/r-base; \
	cd build/r-base; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - conda-forge::r-base=$(R_BASE_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-r-base:$(R_BASE_VERSION) .

r-base-push: r-base-build
	cd build/r-base; \
	docker push systemsgenetics/actg-wgaa-r-base:$(R_BASE_VERSION)

r-base-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-r-base:$(R_BASE_VERSION) R --version | grep version

r-base-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-r-base:$(R_BASE_VERSION) /bin/bash

#
# FastQC
# Builds by creating a custom environment YML file and using the generic conda Dockerfile
fastqc: fastqc-build
fastqc-build:
	mkdir -p build/fastqc; \
	cd build/fastqc; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::fastqc=$(FASTQC_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-fastqc:$(FASTQC_VERSION) .

fastqc-push: fastqc-build
	cd build/fastqc; \
	docker push systemsgenetics/actg-wgaa-fastqc:$(FASTQC_VERSION)

fastqc-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-fastqc:$(FASTQC_VERSION) fastqc --version

fastqc-run:
	docker run -it -u 0 systemsgenetics/actg-wgaa-fastqc:$(FASTQC_VERSION) /bin/bash
