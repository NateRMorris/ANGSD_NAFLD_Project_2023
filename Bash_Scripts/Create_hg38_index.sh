#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name="genome_index"
#SBATCH --time=24:00:00 # HH/MM/SS
#SBATCH --mem=64G # memory requested, units available: K,M,G,T
#SBATCH --mail-user=nam4021@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --requeue

mamba activate angsd

echo 'Starting STAR indexing now'

STAR --runThreadN 6 --runMode genomeGenerate --genomeDir /athena/angsd/scratch/nam4021/hg38_Index --genomeFastaFiles /home/nam4021/project/ncbi_dataset/data/GCF_000001405.40/GCF_000001405.40_GRCh38.p14_genomic.fna --sjdbGTFfile /home/nam4021/project/ncbi_dataset/data/GCF_000001405.40/genomic.gff --sjdbOverhang 99

echo 'Finished'