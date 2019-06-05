### FASTGenomics/ LIMES standard workflow

This is the FASTGenomics/ LIMES standard workflow based on Seurat.

One-app realization of the Seurat standard workflow (contact: FASTGenomics Team or Stefanie Herresthal) written in R markdown.

### Docker image

We use a `fg_r_seurat` image as basis, which is an `rbase:3.5.3` with 
installed fastgenomicsR and Seurat (via github) on top.
The precompiled image is available on docker hub as [fg_r_seurat](https://cloud.docker.com/repository/docker/mvonpapen/fg_r_seurat).
It takes approximately 1 hour to compile and is 2.4GB large.

### Example Data

The app ran successfully on the 3k PBMC data from FASTGenomics. The user should download the corresponding data
and store it in `tests/sample_data/*.tsv`.