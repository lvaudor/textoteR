#' Converts a TXM corpus directory to an R tibble object.
#'
#' @param from_dir the corpus directory (contains metadata.csv and multiple .txt files)
#' @param to_dir the directory that will contain the output file
#' @param filename the name of the Iramuteq-formatted txt file (defaults to "textot.txt")
#' @param encoding the encoding of the TXM corpus (defaults to UTF-8)
#' @return an R tibble with columns id, text, and all columns from metadata.csv
#' @export
#'
#' @examples
#' txm_to_rtibble(from_dir=system.file("extdata/fables",
#'                                     package="textoteR"))
txm_to_rtibble=function(from_dir,
                        to_dir=NULL,
                        filename="textot.txt",
                        encoding="UTF-8"){
  metadata=get_metadata(sourcetype="txm",
                        from_dir=from_dir,
                        encoding=encoding)
  textdata=get_textdata(sourcetype="txm",
                        from_dir=from_dir,
                        encoding=encoding)
  rtibble=dplyr::left_join(metadata,
                           textdata,
                           by="id")
  return(rtibble)
}
