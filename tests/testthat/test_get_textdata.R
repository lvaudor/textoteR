library(testthat)
library(textoteR)

context("get_textdata()")
test_that("get_textdata(sourcetype='txm')",{
    result=get_textdata(sourcetype="txm",
                        from_dir=system.file("extdata/fables",package="textoteR"),
                        encoding="UTF-8")

    expect_true(dplyr::is.tbl(result),
                "Expected a tibble as a result")
    expect_true(ncol(result)==2,
                "Number of columns should be 2")
    expect_true(all(colnames(result)==c("id","text")),
                "Names of columns should be 'id' and 'text'")
})

test_that("get_textdata(sourcetype='iramuteq')",{
  result=get_textdata(sourcetype="iramuteq",
                      from_dir=system.file("extdata",package="textoteR"),
                      filename="macron_covid.txt",
                      encoding="UTF-8")

  expect_true(dplyr::is.tbl(result),
              "Expected a tibble as a result")
  expect_true(ncol(result)==2,
              "Number of columns should be 2")
  expect_true(all(colnames(result)==c("id","text")),
              "Names of columns should be 'id' and 'text'")
})


test_that("get_textdata(sourcetype='rtibble')",{
  result=get_textdata(sourcetype="rtibble",
                      rtibble=LVtweets)
  expect_true(ncol(result)==2,
              "Number of columns should be 2")
  expect_true(all(colnames(result)==c("id","text")),
              "Names of columns should be 'id' and 'text'")
})

