library(testthat)
library(textoteR)


context("test rtibble_to...")

test_that("rtibble_to_iramuteq() is OK",{
  fileout="textot_fables.txt"
  rtibble_to_iramuteq(LVtweets,
                      filename=fileout)
  expect_true(file.exists(fileout),"Expected output file does not exist")
  file.remove(fileout)
})

test_that("rtibble_to_txm() is OK",{
  dirout="tweets_txm"
  rtibble_to_txm(LVtweets,
                 to_dir=dirout)
  expect_true(file.exists(dirout),"Expected output directory does not exist")
  unlink(dirout, recursive = TRUE)
})
