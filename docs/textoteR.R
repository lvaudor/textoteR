## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(textoteR)

## -----------------------------------------------------------------------------
path_to_txm_corpus=system.file("extdata/fables",
                        package="textoteR")
list.files(path_to_txm_corpus)

## -----------------------------------------------------------------------------
txm_to_rtibble(from_dir=path_to_txm_corpus)

## -----------------------------------------------------------------------------
txm_to_iramuteq(from_dir=path_to_txm_corpus,
                filename="fables_iramuteq.txt")

## -----------------------------------------------------------------------------
cat(readLines("fables_iramuteq.txt")[1:10], sep="\n")
file.remove("fables_iramuteq.txt")

## -----------------------------------------------------------------------------
path_to_iramuteq_corpus=system.file("extdata", package="textoteR")

## -----------------------------------------------------------------------------
iramuteq_to_rtibble(from_dir=path_to_iramuteq_corpus,
                    filename="macron_covid.txt")

## -----------------------------------------------------------------------------
iramuteq_to_txm(from_dir=path_to_iramuteq_corpus,
                filename="macron_covid.txt",
                to_dir="macron_covid_corpus")

## -----------------------------------------------------------------------------
list.files("macron_covid_corpus")
cat(readLines("macron_covid_corpus/txt1.txt"))
unlink("macron_covid_corpus",recursive=TRUE)

