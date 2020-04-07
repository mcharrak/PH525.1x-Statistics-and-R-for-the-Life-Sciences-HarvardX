#### week 4 exercise scatterplot

data(nym.2002, package="UsingR")
library(dplyr)

#ex1

# pearson correlation btw. age & time-to-finish
males <- filter(nym.2002, gender == "Male")
females <- filter(nym.2002, gender == "Female")

males_age <- males$age
males_time <- males$time
cor_age_time <- cor(x = males_age , y = males_time  , method = "pearson")
cat(sprintf("The correlation between age and time for male is %.2f.\n", cor_age_time))

#ex2

females_age <- females$age
females_time <- females$time
female_cor_age_time <- cor(x = females_age , y = females_time  , method = "pearson")
cat(sprintf("The correlation between age and time for female is %.3f.\n", female_cor_age_time))

#ex3
hist_breaks <- seq(5,85,5)
label_breaks <- c("5-10",
                  "10-15",
                  "15-20",
                  "20-25",
                  "25-30",
                  "30-35",
                  "35-40",
                  "40-45",
                  "45-50",
                  "50-55",
                  "55-60",
                  "60-65",
                  "65-70",
                  "70-75",
                  "75-80",
                  "80-85")
nym.2002$age.cat <- cut(nym.2002$age, breaks = hist_breaks, labels = label_breaks)

mypar(3,1)
times <- nym.2002$time
ages <- nym.2002$age.cat
#boxplot(split(values,factor))
boxplot(times ~ ages)

# scatterplot no.1
avg_times <- tapply(times, ages, mean)
avg_times <- avg_times[-(1:2)]
valid_ages <- seq(20,85,5)
# age_groups without NaNs :
# 15-20" "20-25" "25-30" "30-35" "35-40" "40-45" "45-50" "50-55" "55-60" "60-65" "65-70" "70-75" "75-80" "80-85
plot(valid_ages,avg_times)
# scatterplot no.2
plot(nym.2002$age,nym.2002$time)



### alternative solution (by gender)
library(rafalib)
mypar(2,2)
plot(females$age, females$time)
plot(males$age, males$time)
group <- floor(females$age/5) * 5
boxplot(females$time~group)
group <- floor(males$age/5) * 5
boxplot(males$time~group)