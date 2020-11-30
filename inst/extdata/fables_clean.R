library(dplyr)
txt_files=list.files("inst/extdata/fables_raw") %>%
  stringr::str_subset("\\.txt")
for (i in 1:length(txt_files)){
  text=readLines(paste0("inst/extdata/fables_raw/",
                        txt_files[i])) %>%
    stringr::str_replace_all("\\([0-9]*\\)","") %>%
    stringr::str_trim()
  text=text[text!=""]
  writeLines(text,
      paste0("inst/extdata/fables/",
             txt_files[i]))
}
