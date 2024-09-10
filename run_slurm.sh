#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=fastq2EZbakR
#SBATCH --cpus-per-task=1
#SBATCH --time=23:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@yale.edu

module purge

module load miniconda/23.5.2

conda activate deploy_snakemake

conda config --set channel_priority strict

snakemake --profile yale_profile/ --rerun-triggers mtime

### Example for how to request rule-specific resources
## Will request 180 GB for the rule named "index" (alignment index creation) and 12 hours for the rule named "align" (read alignment)
# snakemake --profile yale_profile/ --rerun-triggers mtime --set-resources index:mem_mb=180000 align:time=12:00:00