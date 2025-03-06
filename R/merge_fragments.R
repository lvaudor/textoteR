#' Recombines consecutive fragments of natural text into a single text removing redundant parts
#'
#' @param fragments the text fragments to recombine
#' @return the recombined text
#' @export
#'
#' @examples
#'merge_fragments(c("du palais d'un jeune lapin dame belette un beau matin",
#'                  "belette un beau matin s'empara, c'est une rusée",
#'                  "c'est une rusée, le maître étant absent,",
#'                  "ce lui fut chose aisée"))
merge_fragments=function(fragments){
  if(length(fragments)==0){return("")}
  if(length(fragments)==1){return(fragments)}
  for (i in 2:length(fragments)){
    words1=str_split(fragments[i-1]," ")[[1]]
    words2=str_split(fragments[i]," ")[[1]]
    gap=tibble(word=c(words1,
                      words2),
               seg=c(rep(1,length(words1)),
                     rep(2,length(words2))),
               nw=c(1:length(words1),
                    1:length(words2))
    ) %>%
      dplyr::group_by(word) %>%
      dplyr::mutate(n=n()) %>%
      dplyr::filter(n==2) %>%
      dplyr::summarise(gap=-(nw[2]-nw[1])) %>%
      dplyr::group_by(gap) %>%
      dplyr::tally() %>%
      dplyr::top_n(1,n) %>%
      dplyr::pull(gap) %>%
      max()
    if(gap<=0){words1_keep=words1}else{words1_keep=words1[1:gap]}
    result=str_c(c(words1_keep,words2),collapse=" ")
    fragments[i]=result
  }
  return(result)
}
