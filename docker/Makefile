FASTQC_VERSION=0.11.9
FASTP_VERSION=0.23.2

all: build
build: fastqc-build fastp-build
push: fastqc-push fastp-push

#
# FastQC
#
fastqc: fastqc-build
fastqc-build:
	cd fastqc/$(FASTQC_VERSION); \
	docker build -t systemsgenetics/actg-wgaa-fastqc:$(FASTQC_VERSION) .

fastqc-push: fastqc-push
	cd fastqc/$(FASTQC_VERSION); \
	docker push systemsgenetics/actg-wgaa-fastqc:$(FASTQC_VERSION)

#
# FastP
#
fastp: fastp-build
fastp-build:
	cd fastp/$(FASTP_VERSION); \
	docker build -t systemsgenetics/actg-wgaa-fastp:$(FASTP_VERSION) .

fastp-push: fastp-build
	cd fastp/$(FASTP_VERSION); \
	docker push systemsgenetics/actg-wgaa-fastp:$(FASTP_VERSION)
