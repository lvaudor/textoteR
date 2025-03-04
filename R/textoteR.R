#' \code{textoteR} package
#' @description
#' A package that converts text corpora sources from/to possible formats: TXM, Iramuteq, and R tibble.
#' See the README on \href{https://github.com/lvaudor/mixr#readme}{GitHub}
#' @name textoteR
#' @importFrom dplyr %>%
#' @importFrom rlang .data
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1")  utils::globalVariables(c("."))
