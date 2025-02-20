#' Converts a TXM corpus directory to an Iramuteq corpus file.
#'
#' @param from_dir the corpus directory (contains metadata.csv and multiple .txt files)
#' @param to_dir the directory that will contain the output file
#' @param filename the name of the Iramuteq-formatted txt file (defaults to "textot.txt")
#' @param encoding the encoding of the TXM corpus (defaults to UTF-8)
#'
#' @return no R output but new file with name 'filename'
#' @export
#'
#' @examples
#' txm_to_iramuteq(from_dir=system.file("extdata/fables",
#'                                      package="textoteR"),
#'                 filename="alltexts_iramuteq.txt")
txm_to_iramuteq=function(from_dir,
                         to_dir=NULL,
                         filename="textot.txt",
                         encoding="UTF-8"){
    metadata=get_metadata(sourcetype="txm",
                          from_dir=from_dir,
                          encoding=encoding) %>%
      format_metadata() %>%
      dplyr::arrange(id)
    textdata=get_textdata(sourcetype="txm",
                          from_dir=from_dir,
                          encoding=encoding)
      dplyr::arrange(id)
    write_to_iramuteq(metadata,
                      textdata,
                      to_dir=to_dir,
                      filename=filename,
                      encoding=encoding)

}
