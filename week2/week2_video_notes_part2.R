#week 2 code for t-statistic and CLT

library(dplyr)
dat <- read.csv("femaleMiceWeights.csv")

control <- filter(dat, Diet == "chow") %>% select(Bodyweight) %>% unlist()
treatment <- filter(dat, Diet == "hf") %>% select(Bodyweight) %>% unlist()

N <-  length(treatment)
obs <- mean(treatment) - mean(control)
se <- sqrt( var(treatment)/N + var(control)/N )
tstat <- obs / se
sprintf("The tstat value is: %f",tstat)

### p-value
p_value <-2*(1 - pnorm(tstat))
sprintf("The p value is: %f",p_value)

population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)

n <- 10000
nulls <- vector("numeric", n)
for(i in 1:n){
  control <- sample(population, 3)
  treatment <- sample(population, 3)
  se <- sqrt( var(treatment)/3 + var(control)/3 )
  nulls[i] <- ( mean(treatment) - mean(control) )/se
}

library(rafalib)
mypar()

qqnorm(nulls)
abline(0,1)
qqline(nulls)

#### new video t-statistics II
control <- filter(dat, Diet == "chow") %>% select(Bodyweight) %>% unlist()
treatment <- filter(dat, Diet == "hf") %>% select(Bodyweight) %>% unlist()

ttest <-t.test(treatment,control)
ttest