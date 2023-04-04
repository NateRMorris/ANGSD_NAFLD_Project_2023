# ANGSD_NAFLD_Project_2023
Analysis of Next Generation Sequencing - RNA-Seq NAFLD Comparison Study

Please find the ANGSD_NAFLD_Project_Report R-markdown and HTML files within the R_Reports_and_Analysis folder. This will show the steps taken for the downloading, alignment and quality control of the samples used. Once the gene expression data is accessed, it is taken into the Read_counts_NAFLD R-markdown and HTML files, where it is processed for analysis.

Some issues I'd like to address:
- I intend to use the house-keeping genes file that Merv previously posted - hg38.HouseKeepingGenes.bed (from https://sourceforge.net/projects/rseqc/files/BED/Human_Homo_sapiens/hg38.HouseKeepingGenes.bed.gz/download). This should drastically reduce the time it takes to run the RSeQC function and script in the future. Therefore, I'll be able to include all conditions in the alignment quality control.
- When running the feature_counts function, was the extremely low % of Successfully assigned alignments, which showed around 2% for each value. (This can be found my looking at '''cat /home/nam4021/project/project_org/slurm-10633599.out'''. I don't believe this is a normal amount.)
- Analysis: I would like to look further into why my results don't show many positively differentially expressed genes. And these genes don't match the literature very well. This could be due to the samples I chose. I'd also like to re-assess my analysis and see if I can make any proper distinctions for the final report.
