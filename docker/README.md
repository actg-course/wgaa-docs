Current Tool Names
==================
The following is a list of tool names currently supported by this Makefile

- fastqc
- r-base
- sra-tools
- fastp
- samtools
- bwa
- jellyfish
- hifiasm
- mummer
- bedtools
- repeatmasker
- yahs
- multiqc
- hic_qc
- novoplasty
- busco
- braker
- edta

Building, Testing, Running and Pushing
======================================
To build all docker images:
```bash
make
```

To build a specific tool's image
```bash
make <toolname>
```

To test that all images are working run the following and check the output from each tool:
```bash
make test-all
```

To test a specific tool's image
```bash
make <toolname>-test
```

To push all docker images to DockerHub
```bash
make push-all
```

To push a specific tool's image
```bash
make <toolname>-push
```

To run a tool in interactive mode
```bash
make <toolname>-run
```

Changing Tool Versions
======================
To change the version of any software tool, edit the Makefile, find the appropriate variable for the tool and set the version. For most tools you need the tag from bioconda and rebuild the tool.
