#7.3.4 Problems 1-3

#1

library(tidyverse)

ggplot(diamonds)

#Tried using the last piece of data from the reading, but wasn't correct for question

summary(select(diamonds, x, y, z))

ggplot(diamonds)

#We can see that there are a lot of varying degrees of these variables, some are much greater than others, and there are a lot of outliers

#2

ggplot(filter(diamonds, price < 2500), (x = price)) +
  geom_histogram(binwidth = 10, center = 0)

#Error, missing something

ggplot(filter(diamonds, price < 2500), aes(x = price)) +
  geom_histogram(binwidth = 10, center = 0)

#Used the chapter to plug in correct variables, but we see that there is a high spike in diamonds priced between 500 and 1000, and there are no diamonds priced around the 1500 price, which is interesting

#3

diamondsize = diamonds(filter(carat >.99))

diamonds(filter(carat > .99))

#Did not properly use filter function

diamonds %>%
  filter(carat >= 0.99, carat <= 1) %>%
  count(carat)

#I can see that there are 1500 diamonds less than 1 carat and only 23 above .99 carats

#7.4.1

#1

diamonds2 <- diamonds %>%
  mutate(y = ifelse(y < 3)

ggplot(diamonds2, aes(x = y)) + geom_histogram()

#Used object in chapter and when rows are removed the console gives us a warning that says 9 rows have been removed

mean(na.rm = TRUE)

sum(na.rm = TRUE)

#When this is used, any variables that are NA are removed from the dataset before finishing the object

