#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=PROseq
#SBATCH --cpus-per-task=1
#SBATCH --time=10:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@yale.edu

module purge

module load miniconda

conda activate deploy_snakemake

conda config --set channel_priority strict

snakemake --profile simple/ --rerun-triggers mtime
