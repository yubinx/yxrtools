#' scatter_likert Function
#'
#' This function plots anthropometric measurement in cdf
#' @param list of paths to the csv files
#' @keywords concatenate
#' @examples
#'
#'
#'
scatter_likert <- function(df, measure_x, measure_y, rating_key, device,
                           xmin=10,
                           xstep=5,
                           xmax=200,
                           ymin=10,
                           ystep=5,
                           ymax=200
                           ){
  dfplot <- df %>% filter(RatingKey == rating_key) %>% filter(Device %in% c(device))
  p <- ggplot2::ggplot(
    data = dfplot,
    aes(
      x = measure_x,
      y = measure_y,
      color = RatingValue
      # label = PID
    )
  ) +
    geom_point()+
    facet_wrap(~Device) +
    scale_x_continuous(breaks = seq(xmin,xmax,xstep)) +
    scale_y_continuous(breaks = seq(ymin,ymax,ystep)) +
    scale_color_manual(values = c(
      "1" = "red",
      "2" = "orange",
      "3" = "gray",
      "4" = "cyan",
      "5" = "blue"
    ),
    na.value = "black") +
    theme_bw() +
    theme(
      axis.title.x = element_text(size = 10),
      axis.title.y = element_text(size = 10),
      axis.text.x = element_text(size = 10),
      axis.text.y = element_text(size = 10)
    )
  return(p)
}
