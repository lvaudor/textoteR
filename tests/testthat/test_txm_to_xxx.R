library(testthat)
library(textoteR)


context("test txm_to...")

test_that("txm_to_iramuteq() is OK",{
  fileout="textot_fables.txt"
  txm_to_iramuteq(from_dir=system.file("extdata/fables", package="textoteR"),
                  filename=fileout)
  expect_true(file.exists(fileout),"Expected output file does not exist")
  file.remove(fileout)
})

test_that("txm_to_rtibble() is OK",{
  result=txm_to_rtibble(from_dir=system.file("extdata/fables", package="textoteR"))
  expect_true(dplyr::is.tbl(result),
              "Expected a tibble as a result")
  expect_true(ncol(result)>3,
              "Number of columns should be > 3")
  expect_true(all(c("id","text") %in% colnames(result)),
              "Names of columns should comprise 'id' and 'text'")
})
