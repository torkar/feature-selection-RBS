# Feature selection in requirements engineering

## Docker

If you want to replicate the results from the replication package in an easy way, we recommend to install `Docker`, give it plenty of RAM and CPU, and then run the following in the terminal,

```{bash}
docker run -d -p 8787:8787 -e PASSWORD=foo -e ROOT=TRUE torkar/docker_bda:feature_selection
```

Then point your browser to <http://localhost:8787>, enter `rstudio` as username and `foo` as password (change password above to whatever you want). In the browser you now have `RStudio`, and a first step would be to go (lower-right corner) to the directory `development/feature_selection/` and click on the project file `Feature Selection RBS.Rproj`, to load the project.

Next, perhaps open the file `docs/index.Rmd` which you then can `knit`, i.e., re-run analysis and generate the output `index.html` (which is also published at <https://torkar.github.io/feature-selection-RBS/>).

## Replication package and synthetic data

The repository contains scripts and data for replication and evaluation of the methodology used in the manuscript. Unfortunately, due to non-disclosure agreement, the authors are not allowed to release the empirical data as-is. However, in the plots and data description sections one can see the input given to the model development steps. Hence, it is easy to simulate data in order to verify our methodology. This we have done.

We provide a synthetic data set, which an interested reader could make use of to follow our analysis as presented in the replication package.

[data/](https://github.com/torkar/feature-selection-RBS/tree/master/data) contains `data.rds`, which is a synthetic data set generated using the empirical data set. In `synthDataGen.R` one can see how we have generated this data set. This means that one can follow the same steps as in our [replication package](https://torkar.github.io/feature-selection-RBS/), but instead use the synthetic data set by simply loading it in `R` using 

```r
d <- readRDS("data/data.rds")
```

and then go through any selected steps you prefer as found in [docs/index.Rmd](https://github.com/torkar/feature-selection-RBS/tree/master/docs/index.Rmd).

[docs/](https://github.com/torkar/feature-selection-RBS/tree/master/docs) contains the replication package (word of warning, we use `Stan`, `brms`, etc. so there's a lot to install and configure so we recommend using `Docker`).

[plots/](https://github.com/torkar/feature-selection-RBS/tree/master/plots) contains plots as found in the manuscript (in addition to some that have not been included in order to save space).

Finally, one can always look at the replication package directly [online](https://torkar.github.io/feature-selection-RBS/).

In case of questions please contact [Richard Torkar](mailto:torkarr@chalmers.se?subject=[GitHub]%20Feature%20Selection).
