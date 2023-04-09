testthat::test_that("`load_data` returns a dataframe with same column names
                    as the specified names", {
  testthat::expect_equal(column_names, colnames(load_data(
    path,
    names = column_names,
    separator = ","
  )))
})

testthat::test_that("`load_data` returns the same dataframe with `read_delim`", {
  testthat::expect_equal(data_from_read_delim, load_data(
    path,
    names = TRUE,
    separator = ","
  ))
})

testthat::test_that("load_data returns a `dataframe`", {
  testthat::expect_true(is.data.frame(load_data(
    path,
    names = TRUE,
    separator = ","
  )))
})

