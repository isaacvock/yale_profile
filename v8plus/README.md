# Snakemake v8+ profile

If using Snakemake version 8+, the existing yale_profile will not work, as Snakemake radically overhauled how jobs get submitted to clusters in this version. Luckily, the shining star [simple slurm repo](https://github.com/jdblischak/smk-simple-slurm/tree/main) adapted, and so I was able to provide this Snakemake v8+ compatible version of the profile. To run it, all you need to do is have this one yaml file in a separate folder (e.g., `simple`) and run `snakemake --profile path/to/directory` (e.g., `snakemake --profile simple/`).
