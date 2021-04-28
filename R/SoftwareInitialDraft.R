#Title: Twitter User Bio Search
#
#Version: 0.0.0.9000
#
#Authors@R: person("Kate", "Barry", email = "kate.barry0217@gmail.com", role = c("aut", "cre"))
#
#Description: Search Twitter for Twitter user bio data pertaining to a specific term given by the user

License: GPL-3

twitterbiosearch = function(term = ""){

   # CREATE TWITTER OBJECT OF PEOPLE WITH TERM IN THEIR BIO

   user_data = rtweet::search_users(term)

   # EXTRACT BIO DATA FROM EACH USER IN THE TWITTER OBJECT

   bios = rtweet::lookup_users(user_data$user_id)

   # CHOOSE ONLY HELPFUL COLUMNS

   usefuldata = tidyverse::select(bios, user_id, created_at, screen_name, followers_count, friends_count)

   # CREATE NEW VARIABLE THAT IS FOLLOWERS DIVIDED BY FRIENDS

   importanceranking = tidyverse::mutate(usefuldata, fame = followers_count/friends_count)

   # ARRANGE ON NEW VARIABLE

   usersranked = tidyverse::arrange(importanceranking, desc(fame))

   # ASSIGN NEW OBJECT TO USER'S ENVIRONMENT

   twitterbiodata = assign(usersranked)

}
