#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=nfcore
#SBATCH --cpus-per-task=4
#SBATCH --time=23:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@yale.edu

module purge

module load miniconda/23.5.2

conda activate nfcore

### rnaseq version 3.15.0 run
# Pre-reqs:
# 1) You downloaded pipeline with nf-core download
# 2) You are in directory created by nf-core download
# 3) nextflow.config is in that directory with system-specific configuration details
# 4) You have created rnaseq_samplesheet.csv and it exists in your current directory
nextflow run 3_15_0/ -c nextflow.config --genome GRCh38 --outdir results --input rnaseq_samplesheet.csv