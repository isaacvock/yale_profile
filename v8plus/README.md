# Profiles and slurm scripts for Snakemake and nf-core pipelines
This repo includes the files necessary to configure Snakemake and Nextflow to make effective use of Yale HPC resources when running relevant pipelines. The files in this repo are:

1. config.yaml: Snakemake profile configuration file. Currently only compatible with Snakemake < 8.0.0.
2. nextflow.config: Nextflow config file.
3. run_slurm.sh: Shell script to launch a Snakemake pipeline. A simple, single-core job is batched, from which `snakemake` is called. The config.yaml profile will ensure that all rules are run as separately batched slurm jobs.
4. status-sacct-robust.sh: From [this repo](https://github.com/jdblischak/smk-simple-slurm/tree/v7); used by Snakemake to check status of running jobs.
