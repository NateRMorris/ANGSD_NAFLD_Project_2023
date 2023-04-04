#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name="feature_counts"
#SBATCH --time=24:00:00 # HH/MM/SS
#SBATCH --mem=8G # memory requested, units available: K,M,G,T
#SBATCH --mail-user=nam4021@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --requeue

# mamba activate angsd

featureCounts -p --countReadPairs -g gene -a /home/nam4021/project/genomic.gff -o /athena/angsd/scratch/nam4021/gene_counts_NAFLD /athena/angsd/scratch/nam4021/star_NAFLD/HIGH_NAFLD1Aligned.sortedByCoord.out.bam /athena/angsd/scratch/nam4021/star_NAFLD/HIGH_NAFLD2Aligned.sortedByCoord.out.bam /athena/angsd/scratch/nam4021/star_NAFLD/HIGH_NAFLD3Aligned.sortedByCoord.out.bam  /athena/angsd/scratch/nam4021/star_NAFLD/HIGH_NAFLD4Aligned.sortedByCoord.out.bam /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD1Aligned.sortedByCoord.out.bam /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD2Aligned.sortedByCoord.out.bam /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD3Aligned.sortedByCoord.out.bam /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD4Aligned.sortedByCoord.out.bam
