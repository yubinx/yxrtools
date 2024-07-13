#' concat_csv Function
#'
#' This function concatenates multiple csv files (of the same structure) into a master file
#' @param list of paths to the csv files
#' @keywords concatenate
#' @examples
#' filenames <- list.files(path = path, pattern="df_individual", recursive=T,full.names = T)
#' df<-concat_csv(filenames)
#' fwrite(df, paste0(path,"/", "df_master.csv"))


#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

concat_csv <- function(csv_list){
  csv_master <- csv_list %>%
    lapply(fread) %>%
    bind_rows
  return(csv_master)
}
