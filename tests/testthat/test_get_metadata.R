library(testthat)
library(textoteR)



context("get_metadata()")
test_that("get_metadata(sourcetype='txm')",{
  result=get_metadata(sourcetype="txm",
                      from_dir=system.file("extdata/fables",package="textoteR"),
                      encoding="UTF-8")
  expect_true(dplyr::is.tbl(result),
              "Expected a tibble as a result")
  expect_true(ncol(result)>2,
              "Number of columns should be > 2")
  expect_true(any(colnames(result)=="id"),
              "One colum should be named id")
})

test_that("get_metadata(sourcetype='iramuteq')",{
  result=get_metadata(sourcetype="iramuteq",
                      from_dir=system.file("extdata",package="textoteR"),
                      filename="macron_covid.txt",
                      encoding="UTF-8")
  expect_true(dplyr::is.tbl(result),
              "Expected a tibble as a result")
  expect_true(ncol(result)>=2,
              "Number of columns should be >= 2")
  expect_true(any(colnames(result)=="id"),
              "One colum should be named id")
})

test_that("get_metadata(sourcetype='rtibble')",{
  result=get_metadata(sourcetype="rtibble",
                      rtibble=LVtweets)
  expect_true(dplyr::is.tbl(result),
              "Expected a tibble as a result")
  expect_true(ncol(result)>2,
              "Number of columns should be > 2")
  expect_true(any(colnames(result)=="id"),
              "One colum should be named id")
})

