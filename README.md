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

KTool’s argument takes any Twitter query, complete with boolean
operators if desired, surrounded by quotation marks.

``` r
## userdata = KTool("biden")
```

This process is only used to gather information for the user. It is then
up to the user to take the usernames of those gathered by
<code>ktool</code> and input them into their own Twitter account to
create a base of contact between the users. KTool will output A list of
Twitter usernames ranked in order of follower count divided by friend
count as an object in the user’s environment. The object will include
Twitter user’s bios, user\_id, screen\_name, and fame. Fame is the
variable that represents the follower count divided by the friend count.
