#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=2
#SBATCH --ntasks=4
#SBATCH --job-name="align_fasta"
#SBATCH --time=24:00:00 # HH/MM/SS
#SBATCH --mem=36G # memory requested, units available: K,M,G,T
#SBATCH --mail-user=nam4021@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --requeue

mamba activate angsd

echo 'Starting STAR alignment now'

# Define the path to the CSV file
csv_file="sample_sras.csv"
csv_new_name="new_names.csv"
### --readFilesIn LOW_NAFLD3_1.fastq.gz LOW_NAFLD3_2.fastq.gz OTHERS LOOK FINE
## --readFilesIn LOW_NAFLD4__1.fastq.gz LOW_NAFLD4__2.fastq.gz SOMEHOW NAFLD4 is doing this

# Loop through each line in the CSV file
#for line in $(cat "$csv_file"); do
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
    echo $string
    echo $trimmed
    echo $trimmed_1
    echo $trimmed_2

    #/home/nam4021/project/project_org/fastqfiles/$new_name_trim.fastq.gz
    if [ $string =  'LOW_NAFLD4_2' ]; then
    echo "Check for Low 4"
    #echo "$forfor"
    #echo "--readFilesIn $forfour1.fastq.gz $forfour2.fastq.gz"
    #echo "--outFileNamePrefix /home/nam4021/project/project_org/star_NAFLD/$trimmed " \ 

      # Use wget to download the URL specified in the current line
    STAR --runMode alignReads \
     --runThreadN 8 \
     --genomeDir /athena/angsd/scratch/nam4021/hg38_Index  \
     --readFilesCommand gunzip -c \
     --readFilesIn /home/nam4021/project/project_org/fastqfiles/$forfour1.fastq.gz /home/nam4021/project/project_org/fastqfiles/$forfour2.fastq.gz \
     --outFileNamePrefix /athena/angsd/scratch/nam4021/star_NAFLD/$forfour \
     --outSAMtype BAM SortedByCoordinate
    
else
    #echo  "--readFilesIn $trimmed_1.fastq.gz $trimmed_2.fastq.gz"
    #echo  " --outFileNamePrefix /home/nam4021/project/project_org/star_NAFLD/$string " \
      # Use wget to download the URL specified in the current line
    STAR --runMode alignReads \
     --runThreadN 8 \
     --genomeDir /athena/angsd/scratch/nam4021/hg38_Index  \
     --readFilesCommand gunzip -c \
     --readFilesIn /home/nam4021/project/project_org/fastqfiles/$trimmed_1.fastq.gz /home/nam4021/project/project_org/fastqfiles/$trimmed_2.fastq.gz \
     --outFileNamePrefix /athena/angsd/scratch/nam4021/star_NAFLD/$trimmed \
     --outSAMtype BAM SortedByCoordinate
     #--alignIntronMin 10  --alignIntronMax 1200000 https://genome.ucsc.edu/cgi-bin/hgTables to an external site.
     # -- outTmpDir /localScratch
fi

done


echo 'Finished'