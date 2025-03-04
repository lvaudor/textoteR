#' Cleans some patterns in a text by removing them.
#'
#' @param text the character vector to clean.
#' @param patterns_to_nothing the patterns to replace (either passed as a table with column "from" or passed as a vector)
#' @return the same text with patterns replaced by nothing
#' @export
#'
#' @examples
#' replace_with_nothing(c("This is an examplexxx of unclean texxxxt brrr.",
#'                        "brrrxxxx And anotherxxx one.",
#'                        "Yet anothxxxer."),
#'                       c("xxx","brrr"))
replace_with_nothing=function(text, patterns_to_nothing){
  if(!is.null(dim(patterns_to_nothing))){
    from=patterns_to_nothing$from}else{
    from=patterns_to_nothing
    }
  for (i in 1:length(from)){
    text=stringr::str_replace_all(text,from[i],"")
  }
  return(text)
}

#' Cleans some patterns in a text by replacing them.
#'
#' @param text the character vector to clean.
#' @param patterns_to_nothing the patterns to replace and string replacements (passed as a table with columns "from" and "to")
#' @param from the patterns to replace (passed as a vector)
#' @param to the patterns to replace (passed as a vector)
#' @return the same text with patterns replaced by strings
#' @export
#'
#' @examples
#' replace_with(c("This is an apple and this is a banana.",
#'                "Here is a banana and an apple"),
#'              from=c("apple","banana"),
#'              to=c("orange","kiwi"))
replace_with=function(text, patterns_to_strings=NULL, from=NULL, to=NULL){
  if(!is.null(dim(patterns_to_strings))){
    from=patterns_to_strings$from
    to=patterns_to_strings$to
  }
  for (i in 1:length(from)){
    text=stringr::str_replace_all(text,from[i],to[i])
  }
  return(text)
}
