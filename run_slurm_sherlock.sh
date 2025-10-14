#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=normal
#SBATCH --cpus-per-task=1
#SBATCH --time=12:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@stanford.edu

conda activate deploy_snakemake

conda config --set channel_priority strict

snakemake --profile yale_profile/v8plus/ --rerun-triggers mtime

### Example for how to request rule-specific resources
#snakemake --profile yale_profile/v8plus/ --rerun-triggers mtime --set-resources "call_PAS_pints:time='4:00:00'" "call_PAS_bedtools:time='4:00:00'" "call_PAS_bedtools:mem_mb=180000" "call_PAS_pints:mem_mb=180000" "index:mem_mb=180000" "align:mem_mb=70000" "align:time='3:00:00'" "index:time='4:00:00'"
