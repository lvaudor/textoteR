#' Tokenized by word but produce a segment column to keep the context of the words.
#'
#' @param data data to tokenize (as provided to tidytext::unnest_tokens)
#' @param input the column of the data that contains the text to be tokenized
#' @param nwords the number of words that constitute a segment
#' @return the tokenized data with a segment column as word context.
#' @export
#'
#' @examples
#' corpus_data=iramuteq_to_rtibble(from_dir="data-raw",filename="alltexts_iramuteq.txt")
#' unnest_words_keep_context(corpus_data,input="text",nwords=15)
unnest_words_keep_context=function(data,
                                   input,
                                  nwords=20){
  segments=tidytext::unnest_tokens(data,
                                 input=input,
                                 output="segment",
                                 token="ngrams",
                                 n=nwords) %>%
  dplyr::mutate(ns=(1:dplyr::n())-1)

  lemma_data=tidytext::unnest_tokens(segments,
                                     input=segment,
                                     output="word",
                                    token="words",
                                    drop=FALSE) %>%
    dplyr::group_by(ns) %>%
    dplyr::mutate(n=1:dplyr::n(),
           l=ns+n) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(l,word) %>%
    dplyr::mutate(central=ns[which.min(abs(10-nwords))]) %>%
    dplyr::ungroup() %>%
    dplyr::filter(ns==central) %>%
    dplyr::select(-n,-l,-ns,-central)
  return(lemma_data)
}
