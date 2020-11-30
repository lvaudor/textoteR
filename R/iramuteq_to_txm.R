#' Converts an Iramuteq corpus file to a TXM corpus directory.
#'
#' @param from_dir the corpus directory (contains the Iramuteq-formatted file)
#' @param to_dir the directory that will contain the output files
#' @param filename the name of the Iramuteq-formatted txt file (defaults to "textot.txt")
#' @param encoding the encoding of the Iramuteq-formatted file (defaults to UTF-8)
#' @return no R output but new file with name 'filename'
#' @export
#'
#' @examples
#' iramuteq_to_txm(from_dir=system.file("extdata",package="textoteR"),
#'                 filename="macron_covid.txt",
#'                 to_dir="macron_covid_corpus")
iramuteq_to_txm=function(from_dir=NULL,
                         to_dir="corpus_txm_from_iramuteq",
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
  write_to_txm(metadata,
               textdata,
               to_dir=to_dir)
}
