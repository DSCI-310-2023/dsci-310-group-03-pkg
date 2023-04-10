
<!-- README.md is generated from README.Rmd. Please edit that file -->

# group03package

<!-- badges: start -->
[![test-coverage](https://github.com/karlie-tr/dsci-310-group-03-pkg/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/karlie-tr/dsci-310-group-03-pkg/actions/workflows/test-coverage.yaml)
[![codecov](https://codecov.io/gh/karlie-tr/dsci-310-group-03-pkg/branch/add-covr-badge/graph/badge.svg?token=4OJHZH6BST)](https://codecov.io/gh/karlie-tr/dsci-310-group-03-pkg)
<!-- badges: end -->

The goal of group03package is to provide functions that will run our the
analysis for our project in DSCI 310 smoothly. This include loading
data, computing averages for numeric variables and plotting histograms
for EDA, converting character columns into factor and building knn
model.

## Installation

You can install the development version of group03package from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("karlie-tr/dsci-310-group-03-pkg")
```

## Usage

To use our package, first load in the package:

    library(group03package)

At the beginning of the project, it’s necessary to load in the relevant
dataset. Our function `load_data()` will take the csv file, column
names, separator in the csv file, as well as a string specifying how to
handle NAs values. Default arguments are given for separator and
na_values.

    load_data(path, names, separator = ",", na_values = "NAs")

Sometimes, we will also need to convert specific string values in a
column in the dataframe into another string for the model, and it’s
where sub_values() comes in handy. For example:

    sub_values(iris, Species, 'replaced_Setosa', 'setosa')

The function above will replace the rows with value “setasa” in column
“Species” of the iris dataframe into the new string “replaced_Setosa.”
Another function in the package is `avg_numeric()` which will group rows
in the dataframe according to the specified categorical column passed to
the function as an argument, then compute the average for all numeric
attributes for each category and output a summary table.

    avg_numeric(iris,Species)

In the above example, the function will group observations in the iris
dataset based on the “Species” and calculate the mean for each numeric
attributes for each species.

The package also include function `plot_hist()` that allows easier
plotting of the histogram for categorical attributes in the dataframe.
Please see the function file `plot_hist.R` for all the parameters to
customize the plot.

Finally, function `build_model()` will perform cross validation for knn
model fitted on the given dataset using given recipe, taking in argument
whether to optimize the number of neighbors k, and return the fitted knn
model. Usage for the function is as follow:

    build_model <- function(training_set, recipe, optimal, vfold, gridvals, k)

More on the function parameters can be found in `build_model.R`

## Contributing

Please read
[here](https://github.com/karlie-tr/dsci-310-group-03-pkg/blob/main/CONTRIBUTING.md)
on how to contribute to the package.

## License

This package uses MIT open source license.
