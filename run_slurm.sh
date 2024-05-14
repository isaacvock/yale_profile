#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=PROseq
#SBATCH --cpus-per-task=1
#SBATCH --time=12:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@yale.edu

module purge

module load miniconda/23.5.2

conda activate deploy_snakemake

conda config --set channel_priority strict

snakemake --profile yale_profile/ --rerun-triggers mtime
