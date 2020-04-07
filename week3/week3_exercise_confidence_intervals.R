# week 3 Confidence Intervals exercises

library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist()
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist()

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

#ex1
set.seed(seed = 1, sample.kind = "Rounding")
N <- 25
X_ns <- sample(bwt.nonsmoke,N)
X_s <- sample(bwt.smoke,N)
diff <- X_ns - X_s

var_X_ns <- var(X_ns)
var_X_s <- var(X_s)
std_diff <- sqrt(var_X_ns + var_X_s)
se_diff <- std_diff/sqrt(N)

n_df <- 2*N-2
Q <- qt(p = 1 - 0.01/2,df = n_df)
len_half_CI <- Q*se_diff
len_half_CI

#ex4

N <- 5
X_ns <- sample(bwt.nonsmoke,N)
X_s <- sample(bwt.smoke,N)
ttest <- t.test(X_ns,X_s)
ttest$p.value
