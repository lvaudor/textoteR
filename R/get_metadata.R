#' Gets metadata from specified source.
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
#' get_metadata(sourcetype="txm",
#'              from_dir=system.file("extdata/fables",package="textoteR"),
#'              encoding="UTF-8")
#' get_metadata(sourcetype="iramuteq",
#'              from_dir=system.file("extdata",package="textoteR"),
#'              filename="macron_covid.txt",
#'              encoding="UTF-8")
#' get_metadata(sourcetype="rtibble",
#'              rtibble=LVtweets)
get_metadata=function(sourcetype,
                      from_dir=getwd(),
                      filename="textot.txt",
                      encoding="UTF-8",
                      rtibble){
  if(all(c("iramuteq","txm","rtibble")!=sourcetype)){
    stop("Argument sourcetype must be one of 'iramuteq','txm' or 'rtibble'")
  }
  if(sourcetype=="iramuteq"){
    if(!dir.exists(from_dir)){
      stop("Directory from_dir does not exist")}
    filename=paste0(from_dir,"/",filename)
    if(!file.exists(filename)){
      stop("filename does not correspond to existing file")}
    textot=readLines(filename)
    textot=textot[textot!=""]
    metadata=textot %>%
      stringr::str_subset("\\*{4}") %>%
      stringr::str_replace("\\*{4}\\s","") %>%
      stringr::str_replace("^\\*","") %>%
      stringr::str_split("\\s\\*")
    varnames= metadata %>%
      purrr::map(stringr::str_replace,
                 pattern="_[^_]*$",
                 replacement="") %>%
      purrr::pluck(1)
    metadata= metadata  %>%
      purrr::map(stringr::str_extract,
                 pattern="[^_]*$") %>%
      purrr::map(t) %>%
      purrr::map_df(as.data.frame) %>%
      purrr::set_names(varnames) %>%
      tibble::as_tibble(.name_repair="minimal")
  }
  if(sourcetype=="txm"){
    if(!dir.exists(from_dir)){
      stop("Directory from_dir does not exist")}
    metadata_file=paste0(from_dir,"/metadata.csv")
    if(!file.exists(metadata_file)){
      stop("There is no metadata.csv file in directory from_dir")}
    metadata=utils::read.csv(paste0(from_dir,"/metadata.csv"),sep=",",header=T) %>%
      tibble::as_tibble(.name_repair="minimal")
  }
  if(sourcetype=="rtibble"){
    metadata=rtibble %>%
      dplyr::select(-.data$text)
  }
  if(!("id" %in% colnames(metadata))){
    metadata=metadata %>%
        dplyr::mutate(id=stringr::str_pad(1:dplyr::n(),
                                          width=stringr::str_length(dplyr::n()),
                                          pad="0")) %>%
        dplyr::mutate(id=paste0("txt",.data$id))
  }
  metadata=metadata %>%
    dplyr::select(.data$id,
                  dplyr::everything())
  return(metadata)
}
