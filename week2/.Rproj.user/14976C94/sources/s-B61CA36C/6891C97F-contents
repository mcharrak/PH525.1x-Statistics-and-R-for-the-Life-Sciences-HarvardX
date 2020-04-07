# week 2 CLT and t-distribution exercise

library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

set.seed(1, sample.kind = "Rounding")

N <-  10000
n <- 100

mean_x <- 1/6 ### mean_x equals p in exercise
denom <- sqrt(mean_x*(1-mean_x)/n)
X <- 1:6

### roll N=10000 dice each n=100 times 
zs<- replicate(n = 10000, ( mean( (sample(X,n,replace=TRUE) == 6) )  - mean_x ) / denom)
prop_larger_than_2std <-  mean(abs(zs) > 2)
prop_larger_than_2std

#ex2 

### lets make a qqplot of zs to confirm the normal distribution
### confirm that zs is approx normally distributed
qqnorm(zs); qqline(zs)

#ex3 
library(rafalib)
mypar(2,2)
### we have the following dices 
# 2-sided because of p=1/2
# 100-sided because of p=1/100
### therefore we can test both samples for the event x==1

#1 p=0.5 n=5
n <- 5
mean_x <- 0.5 ### mean_x equals p in exercise

denom <- sqrt(mean_x*(1-mean_x)/n)
X <- 1:(1/mean_x)

### roll N=10000 dice each n=100 times 
zs<- replicate(n = 10000, ( mean( (sample(X,n,replace=TRUE) == 1) )  - mean_x ) / denom)
prop_larger_than_2std <-  mean(abs(zs) > 2)
prop_larger_than_2std
qqnorm(zs); abline(0,1)

#2 p=0.5 n=30
n <- 30
mean_x <- 0.5 ### mean_x equals p in exercise

denom <- sqrt(mean_x*(1-mean_x)/n)
X <- 1:(1/mean_x)

### roll N=10000 dice each n=100 times 
zs<- replicate(n = 10000, ( mean( (sample(X,n,replace=TRUE) == 1) )  - mean_x ) / denom)
prop_larger_than_2std <-  mean(abs(zs) > 2)
prop_larger_than_2std
qqnorm(zs); abline(0,1)

#4 p=0.01 n=30
n <- 30
mean_x <- 0.01 ### mean_x equals p in exercise

denom <- sqrt(mean_x*(1-mean_x)/n)
X <- 1:(1/mean_x)

### roll N=10000 dice each n=100 times 
zs<- replicate(n = 10000, ( mean( (sample(X,n,replace=TRUE) == 1) )  - mean_x ) / denom)
prop_larger_than_2std <-  mean(abs(zs) > 2)
prop_larger_than_2std
qqnorm(zs); abline(0,1)

#2 p=0.01 n=100
n <- 100
mean_x <- 0.01 ### mean_x equals p in exercise

denom <- sqrt(mean_x*(1-mean_x)/n)
X <- 1:(1/mean_x)

### roll N=10000 dice each n=100 times 
zs<- replicate(n = 10000, ( mean( (sample(X,n,replace=TRUE) == 1) )  - mean_x ) / denom)
prop_larger_than_2std <-  mean(abs(zs) > 2)
prop_larger_than_2std
qqnorm(zs); abline(0,1)

### alternatively with histograms
ps <- c(0.5,0.5,0.01,0.01)
ns <- c(5,30,30,100)
library(rafalib)
mypar(4,2)
for(i in 1:4){
  p <- ps[i]
  sides <- 1/p
  n <- ns[i]
  zs <- replicate(10000,{
    x <- sample(1:sides,n,replace=TRUE)
    (mean(x==1) - p) / sqrt(p*(1-p)/n)
  }) 
  hist(zs,nclass=7)
  qqnorm(zs)
  abline(0,1)
}

#ex3
X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist()
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist()

sample_mean_X <- mean(X)
sample_mean_X

#ex6
popsd(X)

#ex7

### in effect this questions asks, what is the probability, that abs(\bar{X} - \mu) is larger than 2
### we need a RV that describes the difference between the sample mean and the population mean which in this case is Z
### Z is given by $ sqrt(12) * (\bar{X} - \mu_X) / \sigma_X$

### IMPORTANT: Z is standard-normal distributed, therefore we can just calculate 2*P(Z>2) to get the answer
z_bound_left_tail <- sqrt(12)*(-2)/sd(X)
p_lower_bound_left_tail <- pnorm(z_bound_left_tail)
prop_more_than_2grams <- 2*p_lower_bound_left_tail
prop_more_than_2grams

#ex8
var_X <- var(X)
var_Y <- var(Y)
estimate_SE_Xbar_Ybar <- sqrt( var_X/12 + var_Y/12)
estimate_SE_Xbar_Ybar

#ex9

### cf. book page 50: t-statistic is the ratio of our random variable X and the SE of that RV
num_diff <- mean(Y) - mean(X)
denom_SE <- sqrt( var(Y)/12 + var(X)/12)
tstat <- num_diff / denom_SE
tstat

#ex10

p_right_tail <- 1 - pnorm(tstat)
p_value <-  2*p_right_tail
p_value

### altertatively from scratch
# 1) we standardize the RV
Z <- ( mean(Y) - mean(X) ) / sqrt( var(X)/12 + var(Y)/12)
# 2)  we make use of the CLT which tells us that this RV (diff in sample-means) is normally distributed,
# so we can just request the p-value using the pnorm() function in R
p_value <- 2*( 1-pnorm(Z))
p_value

#ex11 => assumption that RV data is normally distributed in which case the t-statistic will follow a t-dist.
ttest <- t.test(Y,X)
ttest.$p.value