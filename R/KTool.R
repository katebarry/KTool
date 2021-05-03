#' KTool
#'
#' Pulls Twitter usernames with related bio terms
#'
#' @author Kate Barry
#'
#' @param term Any word, in quotation marks.
#'
#' @details
#'
#' \code{KTool()} Gives users the capability to search for any given term and have
#' the most valuable usernames with this term in their bios returned to them in a
#' ranked order so that users have the ability to contact those users with similar
#' interests to them.
#'
#' @return A list of Twitter usernames ranked in order of follower count
#' divided by friend count will appear as an object in the user's
#' environment.
#' }
#'
#' @examples
#' \dontrun{KTool("ceo")}
#' \dontrun{KTool("notredame")}
#'
#' ## The above examples fail unless you have created and installed Twitter
#' ## tokens, per instructions provided at http://rtweet.info/articles/auth.html.
#'
#' @importFrom magrittr "%>%"
#'
#' @export


twitterbiosearch = function(term = ""){

   # CREATE TWITTER OBJECT OF PEOPLE WITH TERM IN THEIR BIO

   user_data = rtweet::search_users(term)

   # EXTRACT BIO DATA FROM EACH USER IN THE TWITTER OBJECT

   bios = rtweet::lookup_users(user_data$user_id)

   # CHOOSE ONLY HELPFUL COLUMNS

   usefuldata = dplyr::select(bios, user_id, screen_name, followers_count, friends_count) %>%

   # CREATE NEW VARIABLE THAT IS FOLLOWERS DIVIDED BY FRIENDS

   dplyr::mutate(usefuldata, fame = followers_count/friends_count) %>%

   # ARRANGE ON NEW VARIABLE

   dplyr::arrange(importanceranking, desc(fame)) %>%

   # ASSIGN NEW OBJECT TO USER'S ENVIRONMENT

   twitterbiodata = assign("data", usersranked, envir = .GlobalEnv)

}
