# LIMES standard workflow

One-app realization of LIMES standard workflow based on a script by Stefanie Herresthal.

## Docker image

We use a `fg_r_seurat` image as basis, which is an `rbase:3.5.3` with
installed fastgenomicsR and Seurat (via github) on top.
The precompiled image is available on docker hub as [fg_r_seurat](https://cloud.docker.com/repository/docker/mvonpapen/fg_r_seurat).
It takes approximately 1 hour to compile and is 2.4GB large.

## Calculation

* APP 1: Data Import
* APP 2: QC plots pre-filtering
* APP 3: Filtering
* APP 4: QC plots post-filtering
* APP 5: Normalization
* APP 6: Define variable genes
* APP 7: Scale data
* APP 8: PCA
* APP 9: Dimensionality reduction
* APP 10: Clustering
* APP 11: Celltype Annotation
* APP 12: DE analysis
* VIZ APP 2: DIMRED / DE Analysis
* VIZ APP 3: Intra-cluster DE genes
* Save image

## Output

The single output of this app is `tests/output/index.html`.
