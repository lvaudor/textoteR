#' Converts an R tibble object to a TXM corpus directory.
#'
#' @param rtibble the name of the R object containing metadata and text data
#' @param to_dir the directory that will contain the output files
#' @param encoding the encoding of the resulting TXM corpus (defaults to UTF-8)
#'
#' @return no R output but new directory to_dir
#' @export
#'
#' @examples
#' rtibble_to_txm(LVtweets,
#'                to_dir="fables_txm")
rtibble_to_txm=function(rtibble,
                        to_dir=NULL,
                        encoding="UTF-8"){
  metadata=get_metadata(sourcetype="rtibble",
                        rtibble=rtibble)
  textdata=get_textdata(sourcetype="rtibble",
                        rtibble=rtibble)
  write_to_txm(metadata,
               textdata,
               to_dir=to_dir)
}
