KTool
================
Kate Barry
2021-04-29

A package giving users the capability to search for any given term and
have the most valuable usernames with this term in their bios returned
to them in a ranked order so that users have the ability to contact
those users with similar interests to them.

## Install

Install from GitHub with the following code:

``` r
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
devtools::install_github("katebarry/KTool")
```

This package uses <code>rtweet</code>. As a result, each user must have
previously acquired authentication from Twitter and instructions to do
that [can be found here](http://rtweet.info/articles/auth.html).

## Usage

ktool’s first argument takes any Twitter query, complete with boolean
operators if desired, surrounded by quotation marks.

`user_data = rtweet::search_users(term)`

The next argument extracts the found users’ bio data by examining the
user ID of each user.

’’’bios = rtweet::lookup\_users(user\_data$user\_id)

The third argument selects only the necessary columns of data. These
necessary columns of data have been determined by selecting only what
the user will be using in following arguments and/or other columns that
may serve useful information to help the user further understand the
data returned to them.

’’’usefuldata = dplyr::select(bios, user\_id, screen\_name,
followers\_count, friends\_count)

The fourth argument uses two of the selected columns, those being
followers\_count and friends\_count, to find a fame ranking. These are
two viable numbers in a Twitter user’s account that tend to resemble how
liable the account is, how active the account is, and how important the
account is. It is crucial to divide the followers by the friends because
a bot account can purchase followers, but if an account has a similar
number of followers to friends it is more likely to be a liable account.

’’’importanceranking = dplyr::mutate(usefuldata, fame =
followers\_count/friends\_count)

The fifth argument serves to arrange the identified users from highest
fame ranking to lowest. This allows users to easily identify what
accounts may be the best to contact with inquiries about their shared
interest. The higher the fame ranking the more liable the account should
be, therefore the more helpful they may be for users to contact.

’’’usersranked = dplyr::arrange(importanceranking, desc(fame))

The sixth argument assigns the output information to the user’s
environment so they can access the data.

’’’twitterbiodata = assign(“data”, usersranked, envir = .GlobalEnv)

``` r
## Create Twitter object of people with term in their bio
user_data = rtweet::search_users("ceo")
 
## Extract bio data from each user in the Twitter object
bios = rtweet::lookup_users(user_data$user_id)

## Choose only hepful columns
usefuldata = dplyr::select(bios, user_id, screen_name, followers_count, friends_count)

## Create new variable that is followers divided by friends
importanceranking = dplyr::mutate(usefuldata, fame = followers_count/friends_count)

##Arrange in new variable
usersranked = dplyr::arrange(importanceranking, desc(fame))

## Assign new object to user's environment
 twitterbiodata = assign("data", usersranked, envir = .GlobalEnv)
```

This process is only used to gather information for the user. It is then
up to the user to take the usernames of those gathered by
<code>ktool</code> and input them into their own Twitter account to
create a base of contact between the users. The ability to automate a
message or a friend request to users with a fame ranking of over .5 is
in the process of being created.

Twitter rate limits cap the number of Search results returned to 18,000
every 15 minutes. Thus, excessive use of <code>ktool</code> in a short
amount of time may result in a warning and inability to pull results. In
this event, simply wait 15 minutes and try again. In an effort to avoid
the Twitter rate limit cap, <code>ktool</code> defaults to returning
1000 results when <code>search = TRUE</code>.
