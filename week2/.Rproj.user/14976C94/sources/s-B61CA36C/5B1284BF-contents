# week 2 code for random variables (RV) excercise

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

#ex1
pop_mean <- mean(x)
pop_mean
#ex2
set.seed(1, sample.kind="Rounding")
rand_5_sample = sample(x,size = 5)
sample_mean = mean(rand_5_sample)
abs_diff <- abs(sample_mean - pop_mean)
abs_diff
#ex3
set.seed(5, sample.kind="Rounding")
rand_5_sample = sample(x,size = 5)
sample_mean = mean(rand_5_sample)
abs_diff <- abs(sample_mean - pop_mean)
abs_diff
#ex4
