#' Create a tidied data frame
#'
#' Reading in a data frame and change column types from characters to
#' factors
#'
#' @param path A single string or a vector of the path to raw file
#' @param names A vector of names of the columns
#' @param separator A string of the separator used in the file
#' @param na_values A string of how the NAs values are represented in the file
#'
#' @return a new tidied data frame with appropriate columns type
#'
#' @examples
#'   load_data(readr::readr_example("mini-gapminder-asia.csv"))
#'
#' @export

load_data <- function(path,
                      names = TRUE,
                      separator = ",",
                      na_values = "NAs") {

  new_data <-
    readr::read_delim(path,
      col_names = names,
      delim = separator,
      show_col_types = FALSE,
      na = na_values
    )

  tidy_data <- new_data |>
    dplyr::mutate_if(is.character, as.factor)

  return(tidy_data)
}

