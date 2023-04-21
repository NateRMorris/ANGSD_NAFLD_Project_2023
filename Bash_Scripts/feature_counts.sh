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

mamba activate angsd

featureCounts -p --countReadPairs -s 2 \
                -g gene -a /home/nam4021/project/ncbi_dataset/data/GCF_000001405.40/genomic.gff \
                -o /athena/angsd/scratch/nam4021/gene_counts_NAFLD_gene_reverse_stranded \
                /athena/angsd/scratch/nam4021/star_NAFLD/HIGH_NAFLD1Aligned.sortedByCoord.out.bam \
                 /athena/angsd/scratch/nam4021/star_NAFLD/HIGH_NAFLD2Aligned.sortedByCoord.out.bam \
                 /athena/angsd/scratch/nam4021/star_NAFLD/HIGH_NAFLD3Aligned.sortedByCoord.out.bam  \
                 /athena/angsd/scratch/nam4021/star_NAFLD/HIGH_NAFLD4Aligned.sortedByCoord.out.bam \
                 /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD1Aligned.sortedByCoord.out.bam \
                 /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD2Aligned.sortedByCoord.out.bam \
                 /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD3Aligned.sortedByCoord.out.bam \
                 /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD4Aligned.sortedByCoord.out.bam

                 # Things I can add: --tmpDir   --minOverlap    -t exon (this is default)
