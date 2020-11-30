LVtweets=readr::read_csv2("data-raw/LVtweets.csv")
LVtweets=LVtweets %>% dplyr::select(text,created_at,is_quote,is_retweet,favorite_count)
usethis::use_data(LVtweets, overwrite=TRUE)
