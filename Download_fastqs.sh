#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name="wget_fastq_files"
#SBATCH --time=24:00:00 # HH/MM/SS
#SBATCH --mem=16G # memory requested, units available: K,M,G,T
#SBATCH --mail-user=nam4021@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --requeue

# Define the path to the CSV file
csv_file="sample_sras.csv"

# Loop through each line in the CSV file
for line in $(cat "$csv_file"); do

    string="${line::-2}"
    trimmed="${line::-4}"
    lastdig="${trimmed:${#trimmed}-1}"
    if [ -f /home/nam4021/project/project_org/fastqfiles/$string.fastq.gz ]; then
    echo "File exists"
else
    echo "File does not exist"
    #echo $string
    #echo $trimmed
    #echo $lastdig
  # Use wget to download the URL specified in the current line
    echo "Getting $string"
    wget -P /home/nam4021/project/project_org/fastqfiles ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR903/00$lastdig/$trimmed/$string.fastq.gz
fi

  #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR903/00$lastdig/$trimmed/$string.fastq.gz

done

echo 'Finished'