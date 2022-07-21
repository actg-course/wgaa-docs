Lab Exercises
=============

Overview
--------

In this lab, we will learn how to clean your raw Illumina data of adapters and poor
quality sequence.

We will do four major things in this lab:

- Learn what Illumina adapter sequences are
- Learn how Illumina quality scores work on the NovaSeq6000
- Run fastp to clean your data
- Calculate sequencing coverage for a sample

    `“If everything was perfect, you would never learn and you would never grow.”` -Beyoncé

Task A
------

Step 1: Learn the structure of an Illumina sequence run
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Illumina sequencing is based on the chemistry of SBS – “sequencing-by-synthesis”. In the
next lecture you’ll learn more about the intricacies of SBS and how the molecules sit on the
machine’s flow cell. In short, SBS chemistry uses four fluorescently labeled nucleotides to
sequence up to billions of clusters on the flow cell surface in parallel, much like Sanger
Sequencing. During each sequencing cycle, a single labeled deoxynucleoside triphosphate (dNTP)
is added to the nucleic acid chain, one base at a time. A’s are added, then imaged, T’s are
added, then imaged, C’s are added, then imaged, then G’s are added. and imaged. After all 4
bases have been added, all molecules on the flow cell should be advanced by one nucleotide of
length, or 1 sequencing cycle. The dNTPs contain a reversible blocking group that serves as a
terminator for polymerization, so after each dNTP incorporation, the fluorescent dye is imaged
to identify the base and then enzymatically cleaved to allow incorporation of the next
nucleotide. Since all four reversible terminator-bound dNTPs (A, C, T, G) are present as
single, separate molecules, natural competition minimizes incorporation bias, which can
be problematic with serial nucleotide incorporation chemistry used in Sanger sequencing.
Base calls are made directly from signal intensity measurements during each cycle, greatly
reducing raw error rates compared to other technologies.

.. figure:: ./media/sbs-tech-web-graphic.jpg
    :alt: 2-Channel SBS Technology | Faster sequencing and data acquisition

    Image Source: `Illumina Website <https://www.illumina.com/content/dam/illumina-marketing/images/science/v2/web-graphic/sbs-tech-web-graphic.jpg>`__


Check out this short, 5 minute video for a quick primer on Illumina sequencing.

.. raw:: html

    <iframe src="https://www.youtube.com/embed/fCd6B5HRaZ8"
        width="560"
        height="315"
        title="YouTube video player"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>


For more than a decade, 4 different dye terminator colors were used (T = green, G = blue,
C = Red, A = yellow), just like Sanger sequencing. This is called 4-color sequencing.
Illumina realized they could speed up sequencing by eliminating two of the colors
altogether, reducing the sequencing time by 50%. This is called two-color sequencing.
There are only two colored fluorophores used now:

If a base lights up green, it’s a T. If a base lights up red, it’s a C. If a base lights
up yellow, it’s A — meaning they mixed red and green fluorphores together for the “A” cycle.
If it’s G, there’s no fluorophore, meaning it’s a dark cycle and no light was emitted. The
axis of the figure below show the intensity of each base, measured in green versus red intensity.

.. figure:: ./media/sbs-redgreen-web-graphic.jpg
    :alt: Simplified Nucleotide Detection

    Image Source `Illumina Website <https://www.illumina.com/content/dam/illumina-marketing/images/science/v2/web-graphic/sbs-redgreen-web-graphic.jpg>`__

.. figure:: ./media/2_and_4_channels_SBS_system.gif
    :alt: Simplified Nucleotide Detection

    Image Source `EC Seq Bioinformatics Website <https://www.ecseq.com/support/ngs/img/2_and_4_channels_SBS_system.gif>`__

Do you have two colors or four colors in Illumina?

Step 2: Learn how quality scores in Illumina work
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

No sequencing technology is perfect (yet), and errors occur at some frequency. It’s
important to understand the source of these kinds of errors, because 1) they impact the
downstream analyses you want to do, and 2) so you can account for them. Illumina has the
lowest per-base error rate of any modern sequencing platform, which is why it is often
employed for variant calling during resequencing.

The reasons for errors during the base calling process are diverse. In most cases the
emitted light signal of a cluster is disturbed. In this context, it is important to know
that the detected light signal is always a sum of single signals from thousands of molecules
within one cluster. Typical reasons for a polluted cluster light signal can be phasing
(see `quality decrease over illumina reads <https://www.ecseq.com/support/ngs/why-does-the-sequence-quality-decrease-over-the-read-in-illumina.html>`__),
overlapping clusters and not uniform clusters
because of an error in the cluster generation (bridge amplification) step. This can often
lead to a gradual degradation of signal over the course of sequencing a molecule. Because
the probability of errors fluctuates and differs from cluster to cluster and from cycle to
cycle it is necessary and useful to indicate a quality for each called and recorded base
expressed in a score.

.. figure:: ./media/phasing_illumina.png
    :alt: Phasing

    On the left, a perfect sequencing run with many molecules acting the same within a
    single cluster. On the right, an example of “phasing”, where the dNTP blocker
    nucleotide isn’t cleaved, polluting the light signal in the cluster.
    Image Source `EC Seq Bioinformatics Website <https://www.ecseq.com/support/ngs/img/phasing_illumina.png>`__

In the last few years, especially with the introduction of Illumina’s bigger machines like the NovaSeq6000, the data produced by the machine is becoming unwieldy. One source of data bloating was that every single nucleotide of every single read had a quality score attached to it. The quality score (Q score) with the attached probability of error (P_error) was given a different ASCII code:

.. figure:: ./media/phread30_ascii_table.png
    :alt: Phred33 offset ASCII table

    Phred33 offset ASCII table.

Illumina’s solution to this issue is to not report the quality score of every single
nucleotide. Instead, quality scores are **binned** into 4 or 8 categories of qualities. See the
table below for an example of how quality scores can be binned into 8 Q-score categories.
In the example below, if a base has a quality score of 7, it gets changed to a “6”. This
saves space because when compression algorithms or formats (like gzip, bzip, .bam) compress
data, repeated stretches of the same byte (like a quality score bin value) can be very
efficiently compressed, resulting in smaller file sizes. In practice, it hasn’t really
mattered much to us; binning actually saves us computational time when we trim the data
and very few people *really* needed to know the Q score of every single base.

.. figure:: ./media/q_score_bins.png
    :alt: Q Score bins
