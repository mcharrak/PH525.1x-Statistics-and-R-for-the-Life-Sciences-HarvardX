# week3 exercise permutations

library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist()
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist()

N <- 10
set.seed(seed = 1, sample.kind = "Rounding")
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- mean(smokers) - mean(nonsmokers)


### perform perturbation test (this will make the null distribution/hypothesis true)
### concatenate data, permute/shuffle, and draw 2 samples of equal size N
dat <- c(nonsmokers,smokers)
shuffle <- sample(dat)

nonsmokerstar <- shuffle[ 1 : N ]
smokerstar <- shuffle[ (N+1) : (2*N) ]
mean(smokerstar) - mean(nonsmokerstar)

#ex1

#step1

set.seed(1,sample.kind = "Rounding")
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- mean(smokers) - mean(nonsmokers)
#step2
set.seed(1,sample.kind = "Rounding")
dat <- c(smokers,nonsmokers)
shuffle <- sample( dat )
smokersstar <- shuffle[1:N]
nonsmokersstar <- shuffle[(N+1):(2*N)]
mean(smokersstar)-mean(nonsmokersstar)
#step3
B <- 1000
### define function to generate a single observation from the null dist.
null <- function(N){
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  mean(smokersstar)-mean(nonsmokersstar)
}
set.seed(1,sample.kind = "Rounding")
nulls <- replicate(1000, null(N))
## we add 1 to avoid p-value of 0
cnt_more_extreme_than_obs <- (sum( abs(nulls) >= abs(obs)) + 1 )
cnt_total <- length(nulls) + 1
p_val <- cnt_more_extreme_than_obs/cnt_total
p_val

#ex2

#step1
set.seed(1,sample.kind = "Rounding")
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- median(smokers) - median(nonsmokers)

#step2
set.seed(1,sample.kind = "Rounding")
dat <- c(smokers,nonsmokers)
shuffle <- sample( dat )
smokersstar <- shuffle[1:N]
nonsmokersstar <- shuffle[(N+1):(2*N)]
median(smokersstar)-median(nonsmokersstar)
#step3
B <- 1000
### define function to generate a single observation from the null dist.
null <- function(N){
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  median(smokersstar)-median(nonsmokersstar)
}
set.seed(1,sample.kind = "Rounding")
nulls <- replicate(1000, null(N))
## as before we add 1 to avoid p-value of 0
cnt_more_extreme_than_obs <- (sum( abs(nulls) >= abs(obs)) + 1 )
cnt_total <- length(nulls) + 1
p_val <- cnt_more_extreme_than_obs/cnt_total
p_val