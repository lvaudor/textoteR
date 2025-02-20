#' Tweets from this packages' author Twitter timeline (@LVaudor). These are data obtained through the Twitter API and `rtweet` package.
#' Only a few variables are kept among all those returned by the API:
#'
#' @format A data frame with 244 rows and 5 variables:
#' \describe{
#'   \item{text}{text of the tweets}
#'   \item{created_at}{date and time of creation}
#'   \item{is_quote}{is the tweet a response to another one?}
#'   \item{is_retweet}{is the tweet a retweet?}
#'   \item{favorite_count}{how many favorites does the tweet have (at time of extraction)}
#' }
"LVtweets"
