#' Converts an Iramuteq corpus file to an R tibble object.
#'
#' @param from_dir the corpus directory (contains the Iramuteq-formatted file)
#' @param filename the name of the Iramuteq-formatted txt file (defaults to "textot.txt")
#' @param encoding the encoding of the Iramuteq-formatted file (defaults to UTF-8)
#' @return a R tibble comprising both metadata and texts
#' @export
#'
#' @examples
#' rtib=iramuteq_to_rtibble(from_dir=system.file("extdata",package="textoteR"),
#'                          filename="macron_covid.txt",
#'                          encoding="UTF-8")
iramuteq_to_rtibble=function(from_dir=NULL,
                             filename="textot.txt",
                             encoding="UTF-8"){
  metadata=get_metadata(sourcetype="iramuteq",
                        from_dir=from_dir,
                        filename=filename,
                        encoding=encoding)
  textdata=get_textdata(sourcetype="iramuteq",
                        from_dir=from_dir,
                        filename=filename,
                        encoding=encoding)
  rtibble=dplyr::left_join(metadata,
                           textdata,
                           by="id")
  return(rtibble)
}
