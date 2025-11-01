#' @export
summarizewith_detail <- function(data,groups,variable,round_num){
  summary_table <- data %>%
    group_by({{groups}})%>%
    summarise(
      mean = mean({{variable}}, na.rm = TRUE),
      median= median({{variable}}, na.rm = TRUE),
      sd= sd({{variable}}, na.rm = TRUE),
      min =  min({{variable}}, na.rm = TRUE),
      max=  max({{variable}}, na.rm = TRUE),
      range = max({{variable}}, na.rm = TRUE) -min({{variable}}, na.rm = TRUE))

  knitr::kable(summary_table, digits =round_num)
}
