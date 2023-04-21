#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=4
#SBATCH --ntasks=8
#SBATCH --job-name="qc_reads"
#SBATCH --time=24:00:00 # HH/MM/SS
#SBATCH --mem=36G # memory requested, units available: K,M,G,T
#SBATCH --mail-user=nam4021@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --requeue

mamba activate rseqc

#fastqc SRR9036307_1.fastq.gz --extract --outdir /home/nam4021/project/fastqc

csv_new_name="new_names.csv"

echo "Starting QC and Reads"

awk 'NR % 2 == 0' "$csv_new_name" | while read line
do
    string="${line::-2}"
    trimmed="${line::-3}"
    forfour="${line::-4}"
    forfour1="${forfour}_1"
    forfour2="${forfour}_2"
    lastdig="${trimmed:${#trimmed}-1}"
    trimmed_1="${trimmed}_1"
    trimmed_2="${trimmed}_2"

    #/home/nam4021/project/project_org/fastqfiles/$new_name_trim.fastq.gz
    if [ $string =  'LOW_NAFLD4_2' ]; then
    echo "Check for Low 4"
    echo "$forfour"

        if [ -e "/athena/angsd/scratch/nam4021/reads/LOW_NAFLD4_body_coverage.out" ]; then
            echo "$forfour exists"

        else
            echo "$forfour does not exist"

            # Issue - not sure why my BAMQC outputs to the /athena/angsd/scratch/nam4021/star_NAFLD/ directory and not the specified QCout
            #/softlib/apps/EL7/BamQC/bin/bamqc [-o /athena/angsd/scratch/nam4021/QCout] [-g /home/nam4021/project/ncbi_dataset/data/GCF_000001405.40] /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD4Aligned.sortedByCoord.out.bam
        
            read_distribution.py -i /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD4Aligned.sortedByCoord.out.bam -r /home/nam4021/project/genomic2.bed > /athena/angsd/scratch/nam4021/reads/LOW_NAFLD4_read_distribution.out

            geneBody_coverage.py -r /home/nam4021/project/genomic2.bed -i /athena/angsd/scratch/nam4021/star_NAFLD/LOW_NAFLD4Aligned.sortedByCoord.out.bam -o /athena/angsd/scratch/nam4021/reads/LOW_NAFLD4_body_coverage.out
        fi
else
    echo "$trimmed"

    if [ -e "/athena/angsd/scratch/nam4021/reads/"$trimmed"_read_distribution.out" ]; then
        echo "$trimmed exists"

    else
        echo "$trimmed does not exist"


        #/softlib/apps/EL7/BamQC/bin/bamqc [-o /athena/angsd/scratch/nam4021/QCout] [-g /home/nam4021/project/ncbi_dataset/data/GCF_000001405.40] /athena/angsd/scratch/nam4021/star_NAFLD/"$trimmed"Aligned.sortedByCoord.out.bam

        read_distribution.py -i /athena/angsd/scratch/nam4021/star_NAFLD/"$trimmed"Aligned.sortedByCoord.out.bam -r /home/nam4021/project/genomic2.bed > /athena/angsd/scratch/nam4021/reads/"$trimmed"_read_distribution.out

        geneBody_coverage.py -r /home/nam4021/project/genomic2.bed -i /athena/angsd/scratch/nam4021/star_NAFLD/"$trimmed"Aligned.sortedByCoord.out.bam -o /athena/angsd/scratch/nam4021/reads/"$trimmed"_body_coverage.out
    fi
fi

done


echo 'Finished'

