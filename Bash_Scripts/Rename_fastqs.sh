#!/bin/bash -l

#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name="rename_fastq"
#SBATCH --time=24:00:00 # HH/MM/SS
#SBATCH --mem=4G # memory requested, units available: K,M,G,T
#SBATCH --mail-user=nam4021@med.cornell.edu
#SBATCH --mail-type=ALL
#SBATCH --requeue

# Define the path to the CSV file
csv_file="sample_sras.csv"
csv_new_name="new_names.csv"

line_count=$(wc -l < $csv_file)
name_count=$(wc -l < $csv_new_name)

# Loop through each line in the CSV file
if [[ "$line_count" == "$name_count" ]]; then
    for line_num in `seq 1 $line_count`;
    do
        old_name=$(awk -F ',' "NR==$line_num" $csv_file) #SRR9036357_2
        new_name=$(awk -F ',' "NR==$line_num" $csv_new_name)
        old_name_trim=${old_name%??}
        new_name_trim=${new_name%?}
        #echo $old_name_trim
        #echo $new_name_trim
        # Use mv to rename the fastqfiles to our sample names
        mv /home/nam4021/project/project_org/fastqfiles/$old_name_trim.fastq.gz /home/nam4021/project/project_org/fastqfiles/$new_name_trim.fastq.gz
        #echo old: /home/nam4021/project/project_org/fastqfiles/$old_name_trim.fastq.gz
        #echo new: /home/nam4021/project/project_org/fastqfiles/$new_name_trim.fastq.gz
        #mv /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD4_2,.fastq.gz /home/nam4021/project/project_org/fastqfiles/LOW_NAFLD4_2.fastq.gz
    ## ONE ISSUE IS THE LAST NEW FILE NAME HAS A COMMA AT THE END, NEED TO MANUALLY CHANGE
    done
else
    echo "CSV of Fastq files and new names are not the same length"
fi

echo 'Finished'