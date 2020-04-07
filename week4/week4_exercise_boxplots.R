### week 4 boxplot exercise

#ex1

### view data
head(InsectSprays)

### make boxplots for reach spray type (factor)
### using either boxplot(split(values,factor)) or boxplot(values ~ factor)
values <- InsectSprays$count
factor <- InsectSprays$spray
#boxplot(split(values,factor))
boxplot(values ~ factor)

#ex2

library(UsingR)
library(dplyr)
library(rafalib)
data(nym.2002,package = "UsingR")

### plot histogram of male vs. female times
sub_data <- select(nym.2002,gender,time)
male_data <- filter(.data = sub_data, gender == "Male")
female_data <- filter(.data = sub_data, gender == "Female")
mypar(2,1)
hist(male_data$time, main = "Male Times")
hist(female_data$time, main = "Female Times")

### plot boxplot of male vs. female times
boxplot(sub_data$time ~ sub_data$gender)

### alternatively
#step1 get times by gender
males <- filter(nym.2002, gender=='Male') %>% select(time) %>% unlist()
females <- filter(nym.2002, gender=='Female') %>% select(time) %>% unlist()
mypar(1,3)
boxplot(females,males)
hist(females, xlim = c(range(nym.2002$time)))
hist(males, xlim = c(range(nym.2002$time)))
