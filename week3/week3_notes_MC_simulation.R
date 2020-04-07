# week 3 notes monte carlo simulation
set.seed(sample.kind = "Rounding",seed = 1)
library(rafalib)

dat <- read.csv("mice_pheno.csv")
controlPopulation <- read.csv("femaleControlsPopulation.csv")
controlPopulation <- unlist(controlPopulation)

### We build a function that automatically generates a t-statistic under the null hypothesis for a sample size of n.
ttestgenerator <- function(n){
  #note that here we have a false "high fat" group where we actually
  #sample from the nonsmokers. this is because we are modeling the *null*
  cases <- sample(controlPopulation,n)
  control <- sample(controlPopulation,n)
  ### construct the RV: diff
  diff <- mean(cases) - mean(control)
  ### because for null hypothesis we assume that the difference in means in 0
  effect_size <- diff - 0
  ### SE error for the RV diff
  var_cases <- var(cases)
  var_control <- var(control)
  se_diff <- sqrt( (var_cases+var_control) / n )
  #construct t-statistic
  tstat <- effect_size/se_diff
  return(tstat)
}

B <- 1000
### experiment1: N = 12
n <- 12
ttests <- replicate(B, ttestgenerator(n = n))
hist(ttests)
### lets check if the distribution of the t-statistic values is well approximated by the normal dist.
qqnorm(ttests)
abline(0,1)

### experiment2: N = 3
n <- 3
ttests <- replicate(B, ttestgenerator(n = n))
hist(ttests)
### lets check if the distribution of the t-statistic values is well approximated by the normal dist.
qqnorm(ttests, main = "approximation with CLT")
abline(0,1)
### => ttests is not anymore well approximated by a standard normal distribution when n IS TOO SMALL

######## LET'S SEE IF A T-DISTRIBUTION BETTER APPROXIMATES OUR TTESTS (we have 1000 t-statistic values) ########

#step1: generate vector of 1000 probability values (so btw. 0 and 1) 
#       for which we wish to request the corresponding quantile value

ps <- (seq(0,999)+0.5)/1000
tdist_quantiles <- qt(ps,df=2*3-2)
qqplot(tdist_quantiles, ttests, xlim=c(-6,6), ylim=c(-6,6), main = "approximation with t-dist.")
abline(0,1)
### => we can see that ttests is better approximated by the t-distribution than by the normal dist. but still not perfect

#step2: lets check if our original data can be well approximated by a normal; we just plot the qqplot of the data
qqnorm(controlPopulation)
qqline(controlPopulation) ##we use abline(0,1) instead iff input to qqplot() is based on a normalized RV

### often we do not have access to the population data, so instead we could generate population data with the computer
controls <- rnorm(n = 5000, mean = 24, sd = 3.5) ### this is a parametric MC simulation

### ttest generator using parametric MC simulation
ttestgenerator <- function(n, mean=24, sd=3.5){
  #note that here we have a false "high fat" group where we actually
  #sample from the nonsmokers. this is because we are modeling the *null*
  cases <- rnorm(n,mean,sd)
  controls <- rnorm(n,mean,sd)
  ### construct the RV: diff
  diff <- mean(cases) - mean(controls)
  ### because for null hypothesis we assume that the difference in means in 0
  effect_size <- diff - 0
  ### SE error for the RV diff
  var_cases <- var(cases)
  var_control <- var(controls)
  se_diff <- sqrt( (var_cases+var_control) / n )
  #construct t-statistic
  tstat <- effect_size/se_diff
  return(tstat)
}

ttests <- replicate(1000, ttestgenerator(3))
qqnorm(ttests)
abline(0,1)