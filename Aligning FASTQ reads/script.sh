#!/bin/bash 

spack load star@2.7.0e
spack load bwa@0.7.15%gcc@6.3.0
spack load samtools@1.9% gcc@6.3.0

echo 'Running BWA'
bwa mem BWA/sacCer3_BWAindex/sacCer3 ERR458496.fastq.gz > BWA/alignments/ERR458496.bwa.sam

echo 'Running STAR'
STAR --runMode alignReads \
--runThreadN 1 \
--genomeDir STAR/sacCer3_STARindex/ \
--readFilesIn ERR458496.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix STAR/alignments/ERR458493. \
--outSAMtype BAM SortedByCoordinate

echo 'Done!'


