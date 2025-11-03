test_that("summarizewith_detail function works with missing values properly ", {
  df_NA <- data.frame(group = c("A","A","B","B","C","C"),
                      value = c(1,2,NA,3,4,5))
  summary_table1 <- summarizewith_detail(df_NA,group,value,2)
  expect_equal(summary_table1$mean[summary_table1$group == "B"] , 3)
  expect_equal(summary_table1$max[summary_table1$group == "B"] , 3)
})

test_that("summarizewith_detail function works with empty dataset", {
  df1 <- data.frame(x1 = character() ,
                    x2 = numeric(),
                    x3 = factor(),
                    stringsAsFactors = FALSE)
  summary_table2 <- summarizewith_detail(df1,x3,x2)
  expect_true("mean" %in% names(summary_table2))
  expect_equal(nrow(summary_table2), 0)
})

test_that("summarizewith_detail function fails on non-numeric value column", {
  df2 <- data.frame(group = c("A","A","B","B","C","C"),
                      value = c("T","T","F","T","F","F"))
  expect_error(summarizewith_detail(df2,group,value),"value argument must be a numeric variable")
})
