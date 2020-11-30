#' Writes metadata and textdata as a TXM corpus directory (with UTF-8 encoding).
#'
#' @param metadata metadata R tibble
#' @param textdata textdata R tibble
#' @param to_dir the directory that will contain the output files
#' @return no R output but new directory to_dir
#' @export
#'
#' @examples
#' metadata=get_metadata(sourcetype="Iramuteq",
#'                       from_dir="data-raw",
#'                       filename="textot.txt")
#' textdata=get_textdata(sourcetype="Iramuteq",
#'                       from_dir="data-raw",
#'                       filename="textot.txt")
#' write_to_txm(metadata,
#'              textdata,
#'              to_dir="corpus_txm")
write_to_txm=function(metadata,
                      textdata,
                      to_dir="corpus_txm"){
    if(dir.exists(to_dir)){
      stoptext=paste0("Directory",
                      to_dir,
                      " already exists.",
                      "Choose another value for to_dir")
      stop(stoptext)
    }
    dir.create(to_dir)
    utils::write.csv(metadata,
                     paste0(to_dir,"/metadata.csv"),
                     row.names=FALSE)
    for (i in 1:nrow(textdata)){
      cat(textdata$text[i],
          file=paste0(to_dir,"/",metadata$id[i],".txt"))
    }
    message(paste0("DONE: created all ___.txt files + metadata.csv in directory \n",
                 getwd(),
                 "/",to_dir))
}
