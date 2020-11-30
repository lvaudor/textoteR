#' Converts an R tibble object to an Iramuteq corpus file.
#'
#' @param rtibble the name of the R object containing metadata and text data
#' @param to_dir the directory that will contain the output file
#' @param filename the name of the Iramuteq-formatted .txt file
#' @param encoding encoding of the resulting Iramuteq corpus
#' @return no R output but new file with name 'filename'
#' @export
#'
#' @examples
#' rtib= txm_to_rtibble(from_dir=system.file("extdata/fables",
#'                                           package="textoteR"))
#' rtibble_to_iramuteq(rtib,
#'                     filename="textot_fables.txt")
rtibble_to_iramuteq=function(rtibble,
                             to_dir=NULL,
                             filename="textot.txt",
                             encoding="UTF-8"){
  metadata=get_metadata(sourcetype="rtibble",
                        rtibble=rtibble)
  textdata=get_textdata(sourcetype="rtibble",
                        rtibble=rtibble)

  write_to_iramuteq(metadata,
                    textdata,
                    to_dir=to_dir,
                    filename=filename,
                    encoding=encoding)
}
