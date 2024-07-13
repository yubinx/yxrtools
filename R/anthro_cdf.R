#' anthro_cdf Function
#'
#' This function plots anthropometric measurement in cdf
#' @param list of paths to the csv files
#' @keywords concatenate
#' @examples



#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

anthro_cdf <- function(df, measurement){
  p <- ggplot2::ggplot() +
    stat_ecdf(
      data = df,
      aes(
        x = measurement
      ),
      geom = "line",
      size = 1
    ) +
    ylab("Cumulative Probability") +
    scale_y_continuous(
      breaks = c(0,0.05,0.1,0.2,0.25,0.3,0.4,0.5,0.6,0.7,0.75,0.8,0.9,0.95,1),
      labels = scales::percent
    ) +
    theme_bw() +
    theme(
      axis.title.x = element_text(size = 10),
      axis.title.y = element_text(size = 10),
      axis.text.x = element_text(size = 10),
      axis.text.y = element_text(size = 10)
    )
  return(p)
}
