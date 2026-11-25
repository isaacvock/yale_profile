# Snakemake v8+ Slurm Profile

Snakemake v8.0+ overhauled cluster job submission into modular executor plugins, so the root Snakemake v7 `config.yaml` will not work on Snakemake `>= 8.0`. Adapted from [smk-simple-slurm](https://github.com/jdblischak/smk-simple-slurm/tree/main), this `v8plus/` directory provides the Snakemake v8+ compatible profile (`config.yaml` + `status-sacct-robust.sh`).

## 1. Required plugin package

To use `executor: cluster-generic` in Snakemake v8+, you must install **`snakemake-executor-plugin-cluster-generic`** in the environment where `snakemake` is installed:

```bash
mamba install -c conda-forge -c bioconda snakemake-executor-plugin-cluster-generic
# or: pip install snakemake-executor-plugin-cluster-generic
```

## 2. Usage

Keep `config.yaml` and `status-sacct-robust.sh` together inside this directory (ensuring `chmod +x status-sacct-robust.sh`), add the directory to `PATH` so all Snakemake 8.x releases locate `status-sacct-robust.sh`, and pass `--profile`:

### Yale HPC (`day` partition — default)

```bash
export PATH="$PWD/yale_profile/v8plus:$PATH"
snakemake --profile yale_profile/v8plus/ --rerun-triggers mtime
```

### Stanford Sherlock (`normal` partition)

Override the default `partition` resource on the command line (or edit `partition="day"` in `v8plus/config.yaml`):

```bash
export PATH="$PWD/yale_profile/v8plus:$PATH"
snakemake --profile yale_profile/v8plus/ --default-resources 'partition="normal"' --rerun-triggers mtime
```
