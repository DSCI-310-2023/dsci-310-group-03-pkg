#' Abstraction of histograms for factorial variables
#'
#' Create a general function to remove repetitive ggplot functions
#'
#' @param data the data frame
#' @param class_column the groups that we are going to grouped the variables by
#' @param bins a number that indicates
#'             the number of bins in histograms
#' @param col the number of columns when arranging the plots
#' @param sep the character that is separating the column names
#' @param title a string that indicates the plot title
#'
#' @return A histogram of all numeric variables that is
#'         grouped by the class_Column
#'
#' @examples
#'   plot_hist(iris, Species, title = "Histogram")
#'   plot_hist(iris, Species, bins = 0.25, col = 3, title = "Histogram")
#'
#' @export

plot_hist <- function(data,
                      class_column,
                      sep = ".",
                      bins = 20,
                      col = 2,
                      title) {

  if (!is.character(title)) {
    stop("`title` should be a string")
  }

  # Determine columns that is numeric
  numeric_col <- data |>
    dplyr::select_if(is.numeric) |>
    colnames()

  if (length(numeric_col) <= 0) {
    stop("`data` only have categorical variables")
  }

  # Create a new empty list
    plots <- list()

  # Create a data frame with only numeric columns and class_column
  numeric_df <- data |>
    dplyr::select(dplyr::any_of(numeric_col), {{ class_column }}) |>
    as.data.frame()

  # Generate a plot for each variable that is numeric
  for (i in 1:(ncol(numeric_df) - 1)) {
    categories <- dplyr::pull(
      numeric_df,
      {{ class_column }}
    )

    # create histograms of each variable then add it to list of plots
    plots[[i]] <- local({
      i <- i
      histogram <- data |>
        ggplot2::ggplot(ggplot2::aes(
          x = numeric_df[, i],
          fill = categories
        )) +
        ggplot2::geom_histogram(
          bins = bins,
          position = "dodge"
        ) +
        ggplot2::labs(
          x = gsub(sep,
                   " ",
                   colnames(numeric_df)[i],
                   fixed = TRUE),
          y = "Frequency",
          fill = colnames(numeric_df)[length(numeric_df)]
        ) +
        ggplot2::theme(text = ggplot2::element_text(size = 10)) +
        ggplot2::scale_fill_brewer(palette = "Paired")
    })
  }

  # create the plot title object
  plot_title <- cowplot::ggdraw() +
     cowplot::draw_label(title, fontface = "bold")

  # add create the list of plots and label them
  p <- cowplot::plot_grid(plotlist = plots,
                     ncol = col,
                     labels = "auto",
                     label_size = 10)

  # return the arranged plots with labels
  return(cowplot::plot_grid(plot_title,
                            p,
                            ncol = 1,
                            rel_heights = c(0.25, 1),
                            align = "vh"))
  }

