# week 3 Monte Carlo exercises

#ex1
set.seed(seed = 1, sample.kind = "Rounding")
N <- 5
X <- rnorm(n = N,mean = 0,sd = 1)
tstat <- sqrt(5)*mean(X)/sd(X)
tstat

#ex2
B <- 1000

ttestgenerator <- function(N=5){
  X <- rnorm(n = N,mean = 0,sd = 1)
  tstat <- sqrt(N)*mean(X)/sd(X)
  return(tstat)
}

ttests <- replicate(B,ttestgenerator())
prop_larger_2 <-  mean(ttests > 2)
prop_larger_2

#ex3
# obtain quantiles for the t-distribution: we can generate percentiles from just above 0 to just below 1
B <- 1000
# step1: generate percentiles
lower_p <- 1/(B+1)
upper_p <- 1 - lower_p
ps <- seq( lower_p , upper_p, length.out = B)
# step2: compute quantiles for the t-distribution
qs <- qt(ps,df = 4)
qqplot(qs, ttests)
abline(0,1)

library(rafalib)
mypar(3,2)
Ns <- seq(5,30,5)
LIM <- c(-4.5,+4.5)
for(N in Ns){
  ### simulation data observed
  ts <- replicate(B,ttestgenerator(N = N))
  ### theory data
  lower_p <- 1/(B+1)
  upper_p <- 1 - lower_p
  ps <- seq( lower_p , upper_p, length.out = B)
  # step2: compute quantiles for the t-distribution with degrees of freem (df) = N-1
  qs <- qt(ps,df = N-1)
  curr_plot_title <- paste("Q-Q plot for sample size ", N) 
  qqplot(qs, ts, main = curr_plot_title,
         xlab = "Theoretical", ylab = "Observed",
         xlim = LIM, ylim = LIM)
  abline(0,1)
}

#ex4
ttestgenerator <- function(N){
  X <- rnorm(n = N)
  Y <- rnorm(n = N)
  tstat <- t.test(X,Y,var.equal = TRUE)$statistic
  return(tstat)
}

Ns <- seq(5,30,5)
B <- 1000
mypar(3,2)
LIM <- c(-4.5,4.5)
for(N in Ns){
  ### simulation data observed
  ts <- replicate(B,ttestgenerator(N = N))
  
  ### theory data
  lower_p <- 1/(B+1)
  upper_p <- 1 - lower_p
  ps <- seq( lower_p , upper_p, length.out = B)
  # step2: compute quantiles for the t-distribution with degrees of freem (df) = N-1
  qs <- qt(ps,df = 2*N-2)
  curr_plot_title <- paste("Q-Q plot for sample size ", N) 
  qqplot(qs, ts, main = curr_plot_title,
         xlab = "Theoretical", ylab = "Observed",
         xlim = LIM, ylim = LIM)
  abline(0,1) 
}


#ex5

X <- sample(c(-1,1), 15, replace=TRUE)
Y <- sample(c(-1,1), 15, replace=TRUE)
ttest <- t.test(X,Y)
ttest$parameter

set.seed(seed = 1, sample.kind = "Rounding")
N <- 15
B <- 10000
### observed data
tstats <- replicate(B,{
  X <- sample(c(-1,1),N, replace = TRUE)
  sqrt(N)*mean(X) / sd(X)
})
### theory data
lower_p <- 1/(B+1)
upper_p <- 1 - lower_p
ps <- seq( lower_p , upper_p, length.out = B)
# step2: compute quantiles for the t-distribution with degrees of freem (df) = N-1
qs <- qt(ps,df = N-1)
qqplot(qs, tstats, xlim = range(tstats))
abline(0,1)

#ex6
set.seed(seed = 1, sample.kind = "Rounding")
N <- 1000
B <- 10000
### observed data
tstats <- replicate(B,{
  X <- sample(c(-1,1),N, replace = TRUE)
  sqrt(N)*mean(X) / sd(X)
})
### theory data
lower_p <- 1/(B+1)
upper_p <- 1 - lower_p
ps <- seq( lower_p , upper_p, length.out = B)
# step2: compute quantiles for the t-distribution with degrees of freem (df) = N-1
qs <- qt(ps,df = N-1)
qqplot(qs, tstats, xlim = range(tstats))
abline(0,1)

#ex7
set.seed(seed = 1, sample.kind = "Rounding")
ttestgenerator <- function(N){
  X <- rnorm(n = N)
  tstat <- sqrt(N)*median(X) / sd(X)
  return(tstat)
}

Ns <- seq(5,55,10)
B <- 10000
mypar(3,2)
LIM <- c(-4.5,4.5)
for(N in Ns){
  ### simulation data observed
  ts <- replicate(B,ttestgenerator(N = N))
  ### theory data
  lower_p <- 1/(B+1)
  upper_p <- 1 - lower_p
  ps <- seq( lower_p , upper_p, length.out = B)
  # step2: compute quantiles for the t-distribution with degrees of freem (df) = N-1
  qs <- qt(ps,df = 2*N-2)
  curr_plot_title <- paste("Q-Q plot with t-distribution for sample size ", N) 
  qqplot(qs, ts, main = curr_plot_title,
         xlab = "Theoretical", ylab = "Observed",
         xlim = LIM, ylim = LIM)
  abline(0,1) 
}

######################################################################################################################
set.seed(seed = 1, sample.kind = "Rounding")
ttestgenerator <- function(N){
  X <- rnorm(n = N)
  tstat <- median(X)
  return(tstat)
}

Ns <- seq(5,55,10)
B <- 10000
mypar(3,2)
LIM <- c(-4.5,4.5)
for(N in Ns){
  ### simulation data observed
  ts <- replicate(B,ttestgenerator(N = N))
  curr_plot_title <- paste("Q-Q plot, normal (0,1/sqrt(N)), sample size ", N, "\nsd ", sd(ts), "1/sqrt(N) ", 1/sqrt(N)) 
  qqnorm(ts, main = curr_plot_title,
         xlab = "Theoretical", ylab = "Observed",
         xlim = LIM, ylim = LIM)
  qqline(ts) 
}

#alternative solution
set.seed(sample.kind = "Rounding",seed = 1)
Ns <- seq(5,45,5)
library(rafalib)
mypar(3,3)
for(N in Ns){
  medians <- replicate(B,ttestgenerator(N = N))
  title <- paste("N=", N, " , ",
                 "mean=", round(x = mean(medians),digits = 2), " , ",
                 "sd*sqrt(N)=", round(sd(medians)*sqrt(N),digits = 2))
  qqnorm(medians, main = title)
  qqline(medians)
}
