### notes week 3 confidence intervals

set.seed(seed = 1,sample.kind = "Rounding")

chowPopulation <- read.csv("femaleControlsPopulation.csv")
chowPopulation <- unlist(chowPopulation)

mu_chow <- mean(chowPopulation)
print(mu_chow) ### this is the true parameter i.e. the population parameter which we are trying to estimate with a sample

N <- 30 ### if we set N <- 5, then we will have much more than 5% of the intervals not containing the populatoin mean
### explanation: the value of Q is not correct anymore becuase we calculate Q assuming that the CLT is applicable
### instead we can use the t-distribution approximation to calculate the Q value
chow <- sample(chowPopulation,N)
print(mean(chow))

se <- sd(chow)/sqrt(N)
print(se)

### now we construct a normally distributed RV with mean 0 and std of 1
( mean(chow) - mean(chowPopulation) ) / se
cat(sprintf("This RV will be between 2 and -2 for %f %% of the time.\n", (100* (pnorm(2) - pnorm(-2))) ))

### we know that the RV will be 95% of the time between -2 and 2 which we can write as:
### -2 <= ( mean(chow) - mean(chowPopulatoin) ) / se <= +2 

### replacing 2 with Q we get:
### -Q <= ( mean(chow) - mean(chowPopulatoin) ) / se <= +Q 

### rewriting the inequality we get
### mean(chowPopulation) - Q*se <= mean(chow) <= mean(chowPopulation) + Q*se

Q <- qnorm(1 - 0.05/2)

interval <- c( mean(chow)-Q*se, mean(chow)+Q*se)
interval
### corrobrate this interval
interval[1] < mu_chow & interval[2] > mu_chow

### let us now plot the confidence intervals many times to see how often they contain the true population mean
library(rafalib)
B <- 250
mypar()
### here type="n" prevents for the two points to be plotted
plot(mean(chowPopulation)+c(-7,7),c(1,1),type="n",ylim = c(1,B), xlab = "weight", ylab = "interval")
abline(v=mean(chowPopulation))
for(i in 1:B){
  chow <- sample(chowPopulation,N)
  mean_chow <- mean(chow)
  ### calculate interval params (Q) and standard error (se)
  se <- sd(chow)/sqrt(N)
  Q <- qnorm(1- 0.05/2)
  interval <- mean_chow + c(-Q*se,+Q*se)
  ### check if the random interval contains the population mean                            
  covered <- mean(chowPopulation) > interval[1] & mean(chowPopulation) < interval[2]
  color <- ifelse(covered,"green","red")
  y_interval <- c(i,i)
  lines(x = interval, y = y_interval, col = color)
}

### instead we can use the t-distribution approximation to calculate the Q value

N <- 5 
### if we set N <- 5, then we will have much more than 5% of the intervals not containing the populatoin mean
### explanation: the value of Q is not correct anymore becuase we calculate Q assuming that the CLT is applicable
chow <- sample(chowPopulation,N)
print(mean(chow))

se <- sd(chow)/sqrt(N)
print(se)

### now we construct a normally distributed RV with mean 0 and std of 1
( mean(chow) - mean(chowPopulation) ) / se
cat(sprintf("This RV will be between 2 and -2 for %f %% of the time.\n", (100* (pnorm(2) - pnorm(-2))) ))

### we know that the RV will be 95% of the time between -2 and 2 which we can write as:
### -2 <= ( mean(chow) - mean(chowPopulatoin) ) / se <= +2 

### replacing 2 with Q we get:
### -Q <= ( mean(chow) - mean(chowPopulatoin) ) / se <= +Q 

### rewriting the inequality we get
### mean(chowPopulation) - Q*se <= mean(chow) <= mean(chowPopulation) + Q*se

### instead we can use the t-distribution approximation to calculate the correct (better approximation) Q value
Q <- qt(1 - 0.05/2, df = 4)

interval <- c( mean(chow)-Q*se, mean(chow)+Q*se)
interval
### corrobrate this interval
interval[1] < mu_chow & interval[2] > mu_chow

### let us now plot the confidence intervals many times to see how often they contain the true population mean
library(rafalib)
B <- 250
mypar()
### here type="n" prevents for the two points to be plotted
plot(mean(chowPopulation)+c(-7,7),c(1,1),type="n",ylim = c(1,B), xlab = "weight", ylab = "interval")
abline(v=mean(chowPopulation))
for(i in 1:B){
  chow <- sample(chowPopulation,N)
  mean_chow <- mean(chow)
  ### calculate interval params (Q) and standard error (se)
  se <- sd(chow)/sqrt(N)
  Q <- qt(1 - 0.05/2, df = 4)
  interval <- mean_chow + c(-Q*se,+Q*se)
  ### check if the random interval contains the population mean                            
  covered <- mean(chowPopulation) > interval[1] & mean(chowPopulation) < interval[2]
  color <- ifelse(covered,"green","red")
  y_interval <- c(i,i)
  lines(x = interval, y = y_interval, col = color)
}