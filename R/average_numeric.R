#' Compute averages of numeric attributes
#'
#' Function to compare the mean values of the numerical attributes
#'
#' @param dataset the training set with a list of numerical attributes
#' @param class_col the name for the column to group by
#'
#' @return A data frame that contains the mean values of all numerical variables
#'
#' @examples avg_numeric(iris,Species)
#'
#' @importFrom dplyr mutate
#'
#' @export

avg_numeric <- function(dataset, class_col) {

  if (!is.data.frame(dataset)) {
    stop("`dataset` should be a data frame or data frame extension")
  }

  col_name <- deparse(substitute(class_col))
  cols <- colnames(dataset)

  if (!(col_name %in% cols)) {
    stop(paste("'",col_name,"'",
               " does not exist in this data frame",
               sep = ""))
  }

  new_dataset <- dataset |>
      mutate({{ class_col }} := as.factor({{ class_col }}))

  new_dataset <- dataset
  summary_averages <- dataset |>
    dplyr::group_by({{ class_col }}) |>
    dplyr::summarise_if(is.numeric, mean, na.rm = TRUE) |>
    as.data.frame()

  return(summary_averages)
}

