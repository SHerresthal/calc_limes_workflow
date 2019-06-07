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

## Testing

To set up the testing environment you will need a data set in the FASTGenomics format
([this
one](https://prod.fastgenomics.org/webclient/detailPage/datasets/dts_eb11d01634434a029ab88333a3113dc7)
for example).  Let's say we call our test data `pbmc_3k`, this means we need to create
the following folder structure

``` bash
mkdir -p tests/sample_data/pbmc_3k/{config,data}
```

And unpack the contents of the zip file into `tests/sample_data/pbmc_3k/data`.  We also
need to add a `parameters.json` file containing the parameter values for this data set
and a mapping file.

Add an empty parameters file
``` bash
echo "{}" > tests/sample_data/pbmc_3k/config/parameters.json
```

and put this into `tests/sample_data/pbmc_3k/config/input_file_mapping.json`
``` json
{
    "expression_matrix": "expression_data.tsv",
    "gene_metadata": "gene_metadata.tsv",
    "cell_metadata": "cell_metadata.tsv",
    "manifest": "manifest.json"
}
```

After you're done you should have the following file structure
```
tests/sample_data/pbmc_3k
├── config
│   ├── input_file_mapping.json
│   └── parameters.json
└── data
    ├── cell_metadata.tsv
    ├── expression_data.tsv
    ├── gene_metadata.tsv
    └── manifest.json
```

We are almost ready now, take a look at the `docker-compose.test.yml` file and update
the paths there to reflect your data folder (here `tests/sample_data/pbmc_3k`).  It
should look like this after you are done

``` yml
version: '3'

services:
  sut:
    build: .
    environment:
      - KNITR_CACHE 1
    volumes:
      - ./tests/sample_data/pbmc_3k/config:/fastgenomics/config/:ro
      - ./tests/sample_data/pbmc_3k/data:/fastgenomics/data/:ro
      - ./tests/sample_data/pbmc_3k/output:/fastgenomics/output/
      - ./tests/sample_data/pbmc_3k/summary:/fastgenomics/summary/
```

If the variable `KNITR_CACHE` is defined, knitr will cache the intermediate results and
re-use them next time you run the app, which will greatly speed up the debugging if you
encounter any errors.

To run the app simply execute
``` bash
docker-compose -f docker-compose.test.yml up --build
```
(you only need to use the `--build` if you make changes to the app).

After knitr runs through, your outputs should be under `tests/sample_data/pbmc_3k/output/index.html`.
