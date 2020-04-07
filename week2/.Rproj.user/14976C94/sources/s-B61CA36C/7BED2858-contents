# week 2 code for normal distribution exercise

library(downloader) 
library(rafalib)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

#ex1

### set the seed to 1
set.seed(1, sample.kind="Rounding")

n <- 1000
sample_size_5 <- 5
sample_size_50 <- 50

avgs_5 <- vector(mode="numeric",length = n)
for(i in 1:n){
  curr_avg <- mean(sample(x,size = sample_size_5))
  avgs_5[i] <- curr_avg
}


avgs_50 <- vector(mode="numeric",length = n)
for(i in 1:n){
  curr_avg <- mean(sample(x,size = sample_size_50))
  avgs_50[i] <- curr_avg
}

### use mypar(1,2) to put both plots on one page
mypar(1,2)
hist(x = avgs_5,xlim=c(18,30))
hist(x = avgs_50,xlim=c(18,30))

#ex2
prop_btw_23_AND_25 <- sum(avgs_50 > 23 & avgs_50 < 25) /length(avgs_50)
prop_btw_23_AND_25

#ex3
upper_bound = 25
lower_bound = 23
given_mean = 23.9
given_sd = 0.43
### formula for answer F(x2=25) - F(x1=23)
F_upper <- pnorm(q = upper_bound, mean = given_mean, sd= given_sd)
F_lower <- pnorm(q =lower_bound,  mean = given_mean, sd= given_sd)
prop_ex3 <-  F_upper - F_lower
prop_ex3
### alternatively we could z-score the data and then use pnorm with default values of mean=0 and sd=1
pnorm( (upper_bound-given_mean) / given_sd) - pnorm( (lower_bound-given_mean) / given_sd)
