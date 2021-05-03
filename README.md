KTool
================
Kate Barry
2021-05-03

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

``` r
user_data = rtweet::search_users("term")
```

    ## Searching for users...

    ## Finished collecting users!

``` r
## Create Twitter object of people with term in their bio
user_data = rtweet::search_users("ceo")
```

This process is only used to gather information for the user. It is then
up to the user to take the usernames of those gathered by
<code>ktool</code> and input them into their own Twitter account to
create a base of contact between the users.
