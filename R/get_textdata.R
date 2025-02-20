#' Gets text data from specified source.
#'
#' @param sourcetype the type of source ("rtibble","txm" or "iramuteq")
#' @param from_dir the corpus directory (contains metadata.csv and multiple .txt files)
#' @param filename the name of the Iramuteq-formatted txt file (defaults to "textot.txt")
#' @param encoding the encoding of the TXM corpus (defaults to UTF-8)
#' @param rtibble the name of the R tibble, if relevant (sourcetype="rtibble")
#' @return a tibble of metadata
#' @export
#'
#' @examples
#' get_textdata(sourcetype="txm",
#'              from_dir=system.file("extdata/fables",package="textoteR"),
#'              encoding="UTF-8")
#' get_textdata(sourcetype="iramuteq",
#'              from_dir=system.file("extdata",package="textoteR"),
#'              filename="macron_covid.txt",
#'              encoding="UTF-8")
#' get_textdata(sourcetype="rtibble",
#'              rtibble=LVtweets)
get_textdata=function(sourcetype,
                      from_dir=getwd(),
                      filename="textot.txt",
                      encoding="UTF-8",
                      rtibble){
  if(all(c("iramuteq","txm","rtibble")!=sourcetype)){
    stop("Argument sourcetype must be one of 'iramuteq','txm' or 'rtibble'")
  }
  if(sourcetype=="iramuteq"){
    if(!dir.exists(from_dir)){stop("Directory from_dir does not exist")}
    filename=paste0(from_dir,"/",filename)
    if(!file.exists(filename)){stop("filename does not correspond to existing file")}
    textot=readLines(filename)
    textot=textot[textot!=""]
    textdata= textot %>%
      stringr::str_subset("\\*{4}", negate=TRUE) %>%
      tibble::tibble(text=.)
  }
  if(sourcetype=="txm"){
    if(!dir.exists(from_dir)){stop("Directory from_dir does not exist")}
    text_files=list.files(from_dir) %>%
      stringr::str_subset("\\.txt$")
    text_ids=text_files %>%
      stringr::str_extract(".*(?=\\.txt$)")
    text_filepaths=paste0(from_dir,"/",text_files)
    textdata=tibble::tibble(id=text_ids,
                            text=text_filepaths %>%
                               purrr::map(readLines,
                                          encoding=encoding) %>%
                               purrr::map_chr(stringr::str_flatten,
                                              collapse=" "))
  }
  if(sourcetype=="rtibble"){
    textdata=rtibble
  }
  if(!("id" %in% colnames(textdata))){
    textdata=textdata %>%
      dplyr::mutate(id=stringr::str_pad(1:dplyr::n(),
                                        width=stringr::str_length(dplyr::n()),
                                        pad="0")) %>%
      dplyr::mutate(id=paste0("txt",.data$id))
  }
  textdata=textdata %>%
    dplyr::select(.data$id,.data$text)
  return(textdata)
}
