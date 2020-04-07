# week 2 code for null distributions excercise

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

#ex1
set.seed(1, sample.kind="Rounding")

avg_x <- mean(x)

n <- 1000
avgs = vector(mode="numeric", length=n)
for(i in 1:n){
  sample_i <- sample(x,size = 5)
  avg_sample_i <- mean(sample_i)
  avgs[i] <-  avg_sample_i
}
hist(avgs) ##to take a look at the averages of our 1000 samples

abs_diffs <- abs(avgs - avg_x)
n_more_than_1_gram <- sum(abs_diffs > 1)
n_more_than_1_gram/n
sprintf("For 1000 samples of size 5, we get an average value of: %f.", n_more_than_1_gram/n)

#ex2
set.seed(1, sample.kind="Rounding")

avg_x <- mean(x)

n <- 10000
avgs = vector(mode="numeric", length=n)
for(i in 1:n){
  sample_i <- sample(x,size = 5)
  avg_sample_i <- mean(sample_i)
  avgs[i] <-  avg_sample_i
}
hist(avgs) ##to take a look at the averages of our 1000 samples

abs_diffs <- abs(avgs - avg_x)
n_more_than_1_gram <- sum(abs_diffs > 1)
n_more_than_1_gram/n
sprintf("For 10000 samples of size 5, we get an average value of: %f.", n_more_than_1_gram/n)

#ex3
set.seed(1, sample.kind="Rounding")

avg_x <- mean(x)

n <- 1000
avgs = vector(mode="numeric", length=n)
for(i in 1:n){
  sample_i <- sample(x,size = 50)
  avg_sample_i <- mean(sample_i)
  avgs[i] <-  avg_sample_i
}
hist(avgs) ##to take a look at the averages of our 1000 samples

abs_diffs <- abs(avgs - avg_x)
n_more_than_1_gram <- sum(abs_diffs > 1)
n_more_than_1_gram/n
sprintf("For 1000 samples of size 50, we get an average value of: %f.", n_more_than_1_gram/n)
