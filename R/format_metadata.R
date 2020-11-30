#' Encode metadata table
#' @param metadata a metadata tibble to reformat so that it is suitable for transformation into Iramuteq's starred variables.
#' @return metadata formatted as required for Iramuteq
#' @export
#'
#' @examples
#' metadata=read.csv(system.file("extdata/fables/metadata.csv",
#'                               package="textoteR"))
#' format_metadata(metadata)
format_metadata=function(metadata){
  format_text=function(text,replacement="-"){
    text_trans=text %>%
      stringr::str_trim() %>%
      stringr::str_replace_all("[:punct:]",replacement) %>%
      stringr::str_replace_all("\\s",replacement)
    return(text_trans)
  }
  metadata_trans=metadata %>%
    dplyr::mutate_all(format_text)
  colnames(metadata_trans)=metadata_trans %>%
    colnames() %>%
    format_text(replacement="_")
  return(metadata_trans)
}
