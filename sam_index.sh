#!/bin/bash

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name="sam_index"
#SBATCH --time=24:00:00 # HH/MM/SS
#SBATCH --mem=4G # memory requested, units available: K,M,G,T
#SBATCH --mail-user=nam4021@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --requeue

# mamba activate angsd

# Define the directory containing the BAM files
bam_dir="/athena/angsd/scratch/nam4021/star_NAFLD"

# Loop through each BAM file in the directory and index it
for bam_file in "${bam_dir}"/*.bam
do
  samtools index "${bam_file}"
done

#samtools index HIGH_NAFLD1Aligned.sortedByCoord.out.bam
#samtools index HIGH_NAFLD2Aligned.sortedByCoord.out.bam
#samtools index HIGH_NAFLD3Aligned.sortedByCoord.out.bam
#samtools index HIGH_NAFLD4Aligned.sortedByCoord.out.bam
#samtools index LOW_NAFLD1Aligned.sortedByCoord.out.bam
#samtools index LOW_NAFLD2Aligned.sortedByCoord.out.bam
#samtools index LOW_NAFLD3Aligned.sortedByCoord.out.bam
#samtools index LOW_NAFLD4Aligned.sortedByCoord.out.bam


#samtools flagstat HIGH_NAFLD1Aligned.sortedByCoord.out.bam