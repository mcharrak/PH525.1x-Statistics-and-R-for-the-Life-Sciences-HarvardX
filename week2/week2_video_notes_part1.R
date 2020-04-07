### week 2 video notes

library(dplyr)

dat <- read.csv("femaleMiceWeights.csv")

control <- filter(dat,Diet == "chow") %>% select(Bodyweight) %>% unlist()
  
treatment <- filter(dat,Diet == "hf") %>% select(Bodyweight) %>% unlist()

population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)

mean(sample(population,size=12))

obs  <- mean(treatment) - mean(control)

population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)

n <- 10000
nulls <- vector("numeric",n)
for(i in 1:n){
  control <- sample(population, 3)
  treatment <- sample(population, 3)
  nulls[i] <-  mean(treatment) - mean(control)
}

mean( nulls > obs) # => this is half of the P-VALUE
mean( abs(nulls) > obs) #  => this is the P-VALUE
hist(nulls)

library(rafalib)
mypar()

## qqnorm: makes a Q-Q plot comparing the observed data to the theoretical normal distribution
qqnorm(nulls)
## qqline: should go right through the data iff data is normally distributed
qqline(nulls)



