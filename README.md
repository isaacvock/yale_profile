# Profiles and Slurm scripts for Snakemake and nf-core pipelines

This repo provides configuration profiles and launcher scripts for running Snakemake and Nextflow pipelines on Yale HPC (and Stanford Sherlock).

## Files in this repo

1. `config.yaml`: Snakemake **v7 (`< 8.0.0`)** Slurm profile (`snakemake --profile yale_profile/`).
2. `v8plus/`: Snakemake **v8+ (`>= 8.0.0`)** Slurm profile (`snakemake --profile yale_profile/v8plus/`), containing `v8plus/config.yaml` and `v8plus/status-sacct-robust.sh`.
3. `status-sacct-robust.sh`: Adapted from [smk-simple-slurm](https://github.com/jdblischak/smk-simple-slurm); polls Slurm job status via `sacct` (with retry delay and `scontrol` fallback) so Snakemake detects OOM and walltime failures.
4. `run_slurm.sh`: Example `sbatch` launcher script for Yale HPC (`day` partition).
5. `run_slurm_sherlock.sh`: Example `sbatch` launcher script for Stanford Sherlock (`normal` partition, Snakemake v8+).
6. `nextflow.config` & `run_nfcore.sh`: Nextflow / nf-core configuration and Slurm launcher script.

## Snakemake v8+ prerequisite

Snakemake 8.0 moved `--cluster` / `--cluster-status` out of core Snakemake into a separate plugin package. When creating your Snakemake v8+ environment, install **`snakemake-executor-plugin-cluster-generic`** alongside `snakemake`:

```bash
mamba create -c conda-forge -c bioconda -n deploy_snakemake \
  "snakemake>=8" snakemake-executor-plugin-cluster-generic snakedeploy
```

Or add it to an existing Snakemake v8+ environment:

```bash
mamba install -c conda-forge -c bioconda snakemake-executor-plugin-cluster-generic
# or: pip install snakemake-executor-plugin-cluster-generic
```

See [`v8plus/README.md`](v8plus/README.md) for usage details and partition overrides (e.g., Yale `day` vs. Stanford Sherlock `normal`).
