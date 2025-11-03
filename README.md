
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SummaryTable

The goal of *SummaryTable* is to provide a way to summarize datasets by
groups. It includes a main function, `summarizewith_detail()`, which
wraps around `dplyr::group_by()` and `dplyr::summarise()` to compute
detailed summary statistics for numeric variables, including the mean,
median, standard deviation, maximum, minimum, and range.

## Installation

You can install the development version of SummaryTable like so:

Package installation can be done directly by
calling`devtools::install_github("annywm/SummaryTable")`

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(SummaryTable)
## basic example code
grade <- data.frame(
subject = rep(c("Math", "English"), each = 3),
score = c(75, 80, NA, 90, 87, 66)
)

summarizewith_detail(grade,subject,score ,2)
#> 
#> 
#> |subject | mean| median|    sd| min| max| range|
#> |:-------|----:|------:|-----:|---:|---:|-----:|
#> |English | 81.0|   87.0| 13.08|  66|  90|    24|
#> |Math    | 77.5|   77.5|  3.54|  75|  80|     5|
#> # A tibble: 2 × 7
#>   subject  mean median    sd   min   max range
#>   <chr>   <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 English  81     87   13.1     66    90    24
#> 2 Math     77.5   77.5  3.54    75    80     5
```
