#' Writes metadata and textdata as an Iramuteq corpus file .
#'
#' @param metadata metadata R tibble
#' @param textdata textdata R tibble
#' @param filename the name of the Iramuteq-formatted txt file (defaults to "textot.txt")
#' @param to_dir the directory that will contain the output files
#' @param encoding the encoding of the Iramuteq-formatted file (defaults to UTF-8)
#' @return no R output but new file with name filename
#' @export
#'
#' @examples
#' metadata=get_metadata(sourcetype="Iramuteq",
#'                       from_dir="data-raw",
#'                       filename="macron_covid.txt")
#' textdata=get_textdata(sourcetype="Iramuteq",
#'                       from_dir="data-raw",
#'                       filename="macron_covid.txt")
#' write_to_iramuteq(metadata,
#'                   textdata,
#'                   to_dir="outputs",
#'                   encoding="UTF-8")
write_to_iramuteq=function(metadata,
                           textdata,
                           to_dir=NULL,
                           filename="textot.txt",
                           encoding="UTF-8"){
  if(is.null(to_dir)){to_dir=getwd()}
  if(!dir.exists(to_dir)){
    stoptext=paste("Directory",
                   to_dir,
                   "does not exist. Choose an existing directory.")
    stop(stoptext)
  }
  path_to_textot=paste0(to_dir,"/",filename)
  if(file.exists(path_to_textot)){
    stoptext=paste("File",
                   path_to_textot,
                   "already exists. Choose another value",
                   "for to_dir or filename")
    stop(stoptext)
  }
  file.create(path_to_textot)
  for (i in 1:nrow(metadata)){
    descripteur_i=c("****")
    for (j in 1:ncol(metadata)){
      descripteur_i=paste(descripteur_i," *",colnames(metadata)[j],"_",metadata[i,j],sep="")
    }
    cat(descripteur_i, file=path_to_textot,append=T)
    cat("\n\n", file=path_to_textot,append=T)
    cat(textdata$text[i],
        file=path_to_textot,
        append=T)
    cat("\n", file=path_to_textot,append=T)
    cat("\n", file=path_to_textot,append=T)
  }
  message(paste0("DONE: created \n ",
                 path_to_textot))
}
