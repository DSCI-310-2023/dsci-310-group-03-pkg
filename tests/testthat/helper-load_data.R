# Load helper data --------------------------------------------------------
path <- readr::readr_example("mini-gapminder-asia.csv")

column_names <- c("A", "B", "C", "D", "E")

data_from_read_delim <- readr::read_delim(
  path,
  col_names = TRUE,
  delim = ",",
  na = "NA"
  ) |>
  dplyr::mutate(country = as.factor(country))