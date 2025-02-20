library(testthat)
library(textoteR)


context("test iramuteq_to...")

test_that("iramuteq_to_txm() is OK",{
  dirout="macron_covid_txm"
  iramuteq_to_txm(from_dir=system.file("extdata", package="textoteR"),
                  filename="macron_covid.txt",
                  to_dir=dirout
                  )
  metadata=get_metadata(sourcetype="iramuteq",
                        from_dir=system.file("extdata", package="textoteR"),
                        filename="macron_covid.txt")
  expect_true(nrow(metadata)==length(list.files(dirout))-1,
              "Number of files in output directory is not the one expected.")
  expect_true(dir.exists(dirout),
              "Expected output directory does not exist")
  unlink(dirout, recursive=TRUE)
})

test_that("iramuteq_to_rtibble() is OK",{
  result=iramuteq_to_rtibble(from_dir=system.file("extdata", package="textoteR"),
                            filename="macron_covid.txt")
  expect_true(dplyr::is.tbl(result),
              "Expected a tibble as a result")
  expect_true(ncol(result)>2,
              "Number of columns should be > 2")
  expect_true(all(c("id","text") %in% colnames(result)),
              "Names of columns should comprise 'id' and 'text'")
})
