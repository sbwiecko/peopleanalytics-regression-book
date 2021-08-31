my_names <- c("Sébastien", "Wieckowski")
length(my_names)
which <- c(1,2)
length(which)

length(my_names) == length(which)

names <- data.frame(my_names, which)
dim(names)

new_names <- data.frame(my_names, as.character(which))
str(new_names)

ugtests <- read.csv("http://peopleanalytics-regression-book.org/data/ugtests.csv")
dim(ugtests)
head(x=ugtests, n=3)
summary(ugtests)
sum(is.na(ugtests))

subset(ugtests, subset=(ugtests$Yr1 > 50))

library(dplyr)
help(filter)

filter(ugtests, Yr1 > 50)

ugtests %>%
  filter(Yr3 > 100) %>%
  summarise(avg=mean(Yr1)) %>% # mean function doesn't work (see below)...
  round()

ugtests %>%
  filter(Yr3 > 100) %>%
  select(Yr1) %>%
  colMeans() %>%
  round()

ugtests$Yr1 %>%
  subset(ugtests$Yr3 > 100) %>%
  mean() %>%
  round()

# pull() creates a vector -- which, in this case, is numeric --
# whereas select() creates a data frame.
# Basically, pull() is the equivalent to writing mtcars$cyl or
# mtcars[, "cyl"], whereas select() removes all of the columns except
# for cyl but maintains the data frame structure

ugtests %>%
  filter(Yr3 > 100) %>%
  pull(Yr1) %>% # pull() is similar to $
  mean() %>%
  round()

plot(
  x = ugtests$Yr3,
  y = ugtests$Final,
  xlab = "Yr3 scores",
  ylab = "Final scores",
  main = "ugtests scatter plot"
)

ugtests$final_grade <- ugtests$Final %>%
  cut(breaks = 5, ordered_result = T, labels = c(1:5)) %>%
  as.numeric()

head(ugtests)

hist(ugtests$final_grade, breaks = 0:5)

boxplot(
  formula = Yr3 ~ final_grade,
  data = ugtests,
  xlab = "Final score grade",
  ylab = "Yr3 score",
  main = "box plot"
)
