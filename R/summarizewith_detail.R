#' @title Get summary statistics of a numeric variable by group
#' @description
#' Compute the mean, median, standard deviation, minimum, maximum, and range of a numeric variable
#' grouped by one categorical variable, handling missing data and rounding the results to
#' four decimal places by default. The function prints a formatted summary table.
#'
#' @param data A data.frame or tibble containing the data.
#' @param group A categorical group variable used to build the summary table.
#' @param variable A numeric variable to summarize.
#' @param round_num The number of decimal places for the printed summary table (default = 4).
#' @param na.rm Logical, whether or not to remove NAs (default = TRUE).
#'
#' @return A tibble with one row per group and summary statistics as columns.
#'
#' @examples
#' grade <- data.frame(subject = rep(c("Math", "English"), each = 3),score = c(75, 80, NA, 90, 87, 66))
#' summarizewith_detail(grade,subject,score ,2)
#'
#' library(datateachr)
#' summarizewith_detail(cancer_sample,diagnosis,area_mean)
#'
#' @export
#' @importFrom dplyr group_by summarise pull
#' @importFrom knitr kable
#' @importFrom magrittr %>%
summarizewith_detail <- function(data,group,variable,round_num=4, na.rm = TRUE){
  variable_arg <- data %>%pull({{variable}})
  if(!is.numeric(variable_arg)){
    stop("value argument must be a numeric variable")}
  summary_table <- data %>%
    group_by({{group}})%>%
    summarise(
      mean = mean({{variable}}, na.rm = na.rm),
      median= median({{variable}}, na.rm = na.rm),
      sd= sd({{variable}}, na.rm = na.rm),
      min =  min({{variable}}, na.rm = na.rm),
      max=  max({{variable}}, na.rm = na.rm),
      range = max({{variable}}, na.rm = na.rm) -min({{variable}}, na.rm = na.rm))

  print(knitr::kable(summary_table, digits =round_num))
  return(summary_table)
}
