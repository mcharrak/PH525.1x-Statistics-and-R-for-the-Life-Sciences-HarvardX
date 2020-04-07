# week 3 lecture notes power calculations
library(dplyr)
### load data
dat <- read.csv("mice_pheno.csv") 

controlPopulation <- filter(dat,Sex=="F" & Diet =="chow") %>% select(Bodyweight) %>% unlist()
hfPopulation <- filter(dat,Sex=="F" & Diet =="hf") %>% select(Bodyweight) %>% unlist()

mu_control <- mean(controlPopulation)
mu_hf <- mean(hfPopulation)
cat(sprintf("The absolute difference between the two sample means is: %f.\n",mu_hf-mu_control))
cat(sprintf("The percentage difference between the two sample means is: %.3f%%.\n",(mu_hf-mu_control)/mu_control*100))

set.seed(seed = 1,sample.kind = "Rounding")
N <- 5
hf <- sample(hfPopulation,N)
control <- sample(controlPopulation,N)
cat(sprintf("With a sample size of N=%i, the p-value is about %.5f.\n",N,t.test(hf,control)$p.value))
### => so above we make a type II error because there is a significant difference between the group's means, however,
###    with a p-value of 0.141 we fail to reject the null hypothesis H0 given H0 is false

### lets increase the sample size from N=5 to N=30
N <- 30
hf <- sample(hfPopulation,N)
control <- sample(controlPopulation,N)
cat(sprintf("With a sample size of N=%i, the p-value is about %.5f.\n",N,t.test(hf,control)$p.value))

N <- 12
alpha <- 0.05 ### cut-off for rejecting the null hypothesis H0, if the p-value is smaller than this cut-off

B <- 2000

### define a function called reject(), which for a given N runs a t-test and decides if to reject H0 or not
reject <- function(N, alpha=0.05){
  hf <- sample(hfPopulation,N)
  control <- sample(controlPopulation,N)
  pval <- t.test(hf,control)$p.value
  pval < alpha ### this is what the function will return TRUE or FALSE
}

reject(12)

### we run the function reject() for B times using "replicate" method
rejections <- replicate(B,reject(N))
cat(sprintf("\nIn %.2f%% of the time (which is the power of our test), we correctly
reject the null hypothesis H0 given  that the null hypothesis is false.\n
=> In effect in %.2f%% of the time we make a type II error.\n", 
100*mean(rejections) , (1 - mean(rejections))*100 ) )

### lets calculate the power for various sample sizes N
Ns <- seq(5,50,5)

calPower <- function(N){
  rejections <- replicate(B,reject(N))
  ### power == mean(rejections)
  mean(rejections)
}

powers <- sapply(Ns,calPower)
powers

plot(Ns, powers, type = "b")
### => from the plot we can see that as the sample size N increases, the power increases