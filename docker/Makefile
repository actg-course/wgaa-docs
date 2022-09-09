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
BUSCO_VERSION=4.1.2
BRAKER_VERSION=2.1.6
EDTA_VERSION=2.0.1

all: build-all
build-all: fastqc-build r-base-build sra-tools-build fastp-build \
	samtools-build bwa-build jellyfish-build hifiasm-build mummer-build \
	bedtools-build repeatmasker-build yahs-build multiqc-build \
	yahs-build hic_qc-build novoplasty-build busco-build braker-build \
	edta-build
push-all: fastqc-push r-base-push sra-tools-push fastp-push \
	samtools-push bwa-push jellyfish-push hifiasm-push mummer-push \
	bedtools-push repeatmasker-push yahs-push multiqc-push \
	yahs-push hic_qc-push novoplasty-push busco-push braker-push \
	edta-push
test-all: fastqc-test r-base-test sra-tools-test fastp-test \
	samtools-test bwa-test jellyfish-test hifiasm-test mummer-test \
	bedtools-test repeatmasker-test yahs-test multiqc-test \
	yahs-test hic_qc-test novoplasty-test busco-test braker-test \
	edta-test


#
# EDTA
#
edta: edta-build
edta-build:
	mkdir -p build/edta; \
	cd build/edta; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_template.yml environment.yml; \
	echo "  - bioconda::edta=$(EDTA_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-edta:$(EDTA_VERSION) .

edta-push: edta-build
	cd build/edta; \
	docker push systemsgenetics/actg-wgaa-edta:$(EDTA_VERSION)

edta-test: 
	docker run -it -u 0 systemsgenetics/actg-wgaa-edta:$(EDTA_VERSION) edta

#
# BRAKER
#
braker: braker-build
braker-build:
	mkdir -p build/braker; \
	cd build/braker; \
	cp ../../dockerfile-conda ./Dockerfile; \
	cp ../../environment_braker.yml environment.yml; \
	echo "  - bioconda::braker2=$(BRAKER_VERSION)" >> environment.yml; \
	docker build -t systemsgenetics/actg-wgaa-braker:$(BRAKER_VERSION) .

braker-push: braker-build
	cd build/braker; \
	docker push systemsgenetics/actg-wgaa-braker:$(BRAKER_VERSION)

braker-test:
	docker run -it -u 0 systemsgenetics/actg-wgaa-braker:$(BRAKER_VERSION) braker.pl --version

#
# BUSCO
#
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

#
# NOVOplasty
#
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
	docker run -it -u 0 systemsgenetics/actg-wgaa-novoplasty:$(NOVOPLASTY_VERSION) NOVOPlasty$(NOVOPLASTY_VERSION).pl

#
# hic_qc
#
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
	docker run -it -u 0 systemsgenetics/actg-wgaa-hic_qc:$(HIC_QC_VERSION) hic_qc --version

#
# yahs
#
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

#
# repeatmasker
#
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

#
# bedtools
#
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

#
# mummer
#
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

#
# hifiasm
#
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


#
# Jellyfish
#
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

#
# BWA
#
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

#
# SAMTools
#
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

#
# FastP
#
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

#
# SRA Tools
#
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
	docker run -it -u 0 systemsgenetics/actg-wgaa-sra-tools:$(SRA_TOOLS_VERSION) fastq-dump --version

#
# MultiQC
#
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

#
# R
#
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
	docker run -it -u 0 systemsgenetics/actg-wgaa-r-base:$(R_BASE_VERSION) R --version

#
# FastQC
#
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
