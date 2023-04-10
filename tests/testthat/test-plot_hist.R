testthat::test_that("ggplot2 histogram works", {
  vdiffr::expect_doppelganger(
    "histograms from ggplot",
    histograms_ggplot_with_title
  )
  vdiffr::expect_doppelganger(
    "histograms from function",
    plot_hist(iris, Species, title = "Title")
  )
})

testthat::test_that("`plot_hist` should return an error when `title` is not
                    a string", {
  testthat::expect_error(
    plot_hist(iris, Species, title = 2),
    "`title` should be a string"
  )
  testthat::expect_error(
    plot_hist(iris, Species, title = c(2, 3)),
    "`title` should be a string"
  )
})

testthat::test_that("`plot_hist` should return an error when there is
                    no categorical variables in the data frame", {
  testthat::expect_error(
    plot_hist(fruit_no_numeric_df, fruit, title = "Title"),
    "`data` only have categorical variables"
  )
})
