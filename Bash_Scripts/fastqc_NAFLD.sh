#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name="fastqc"
#SBATCH --time=24:00:00 # HH/MM/SS
#SBATCH --mem=8G # memory requested, units available: K,M,G,T
#SBATCH --mail-user=nam4021@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --requeue

fastqc /home/nam4021/project/project_org/fastqfiles/HIGH_NAFLD1_1.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/HIGH_NAFLD1_2.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/HIGH_NAFLD2_1.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/HIGH_NAFLD2_2.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/HIGH_NAFLD3_1.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/HIGH_NAFLD3_2.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/HIGH_NAFLD4_1.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/HIGH_NAFLD4_2.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD1_1.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD1_2.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD2_1.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD2_2.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD3_1.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD3_2.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD4_1.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
fastqc /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD4_2.fastq.gz --extract --outdir /athena/angsd/scratch/nam4021/fastqc_NAFLD
