# week 3 power calculations exercise

library(downloader)
library(rafalib)

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist ()
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist()

mean(bwt.nonsmoke)-mean(bwt.smoke)
(mean(bwt.nonsmoke)-mean(bwt.smoke))/mean(bwt.smoke)*100 ###percentage increase of birth-weight from smoke to non-smoke
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

#ex1 
set.seed(seed = 1, sample.kind = "Rounding")
N <- 5
X_s <- sample(bwt.smoke,N)
X_ns <- sample(bwt.nonsmoke,N)
t.test(X_s,X_ns)$p.value

#ex2 
alpha <- 0.05
B <- 10000
# step1: define function for rejecting
reject <- function(N,alpha=0.05){
  X_s <- sample(bwt.smoke,N)
  X_ns <- sample(bwt.nonsmoke,N)
  pval <- t.test(X_s,X_ns)$p.value
  pval < alpha
}

rejections <- replicate(B,reject(N))
cat(sprintf("\nFor a signfificance level of %.2f and a sample size of %i, we are rejecting the 
null hypothesis H0 %2.f%% of the time, when H0 is in fact false.\n", alpha, N, 100*mean(rejections)))

#ex3
Ns <- seq(30,120,30)
### step2: write a function for calculating the power
power <- function(N){
  rejections <- replicate(B,reject(N,alpha = alpha))
  mean(rejections)
}

### now let us calculate the power for each of these sample sizes in Ns
powers <- sapply(Ns,power)
plot(Ns,powers,type="b",main = "alpha 0.05")

#ex4
### reduce alpha from 0.05 to 0.01
alpha <- 0.01
Ns <- seq(30,120,30)
### step2: write a function for calculating the power
power <- function(N){
  rejections <- replicate(B,reject(N,alpha = alpha))
  mean(rejections)
}

### now let us calculate the power for each of these sample sizes in Ns
powers <- sapply(Ns,power)
plot(Ns,powers,type="b",main = "alpha 0.01")