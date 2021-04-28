#' Reddit Extractor
#'
#' This package will pull trends from Reddit on a term given by the user
#'
#' Details
#'
#' @author Kate Barry
#'
#' @param term describe
#'
#' @return The trends on Reddit
#'
#' @examples
#'
#'
#' @export

reddittrends = function(term = ""){

  #Search Reddit for a term

  trendsearch = RedditExtractoR::get_reddit("")

  #Select only important columns from data

  usefuldata = dplyr::select(trendsearch, subreddit, controversiality, post_score)

  #Arrange data by the post_score to see popularity ranking

  popularityrank = dplyr::arrange(usefuldata, desc(post_score))

  #Assign

  assign("reddittrends", envir = .GlobalEnv)


  }
