# week 2 code for population, samples and estimates exercise

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename)

### remove lines that contain any missing value
dat <- na.omit(dat)

#ex1
library(dplyr)
x <- dat %>% filter(Diet=="chow") %>% filter(Sex=="M") %>% select(Bodyweight) %>% unlist()
mean_x <- mean(x)
mean_x

#ex2

library(rafalib)
sd_x <- popsd(x)
sd_x

#ex3
### set the seed to 1
set.seed(1, sample.kind="Rounding")
sample_size <- 25
X <- sample(x = x, size = sample_size)
mean_X <- mean(X)
mean_X

#ex4
y <- filter(.data = dat, Sex=="M" & Diet =="hf") %>% select(Bodyweight) %>% unlist()
mean_y <- mean(y)
mean_y

#ex5

sd_y <- popsd(y)
sd_y

#ex6

### set the seed to 1
set.seed(1, sample.kind="Rounding")
sample_size <- 25
Y <- sample(x = y, size = sample_size)
mean_Y <- mean(Y)
mean_Y

#ex7
diff_y_x <- mean(y) - mean(x)
diff_Y_X <- mean_Y - mean_X
abs_diff <-  abs(diff_y_x - diff_Y_X)
abs_diff

#ex8 (same as ex1 to ex7 with only difference: Sex=='F')
library(dplyr)
x <- dat %>% filter(Diet=="chow") %>% filter(Sex=="F") %>% select(Bodyweight) %>% unlist()
mean_x <- mean(x)
mean_x

y <- filter(.data = dat, Sex=="F" & Diet =="hf") %>% select(Bodyweight) %>% unlist()
mean_y <- mean(y)
mean_y


### set the seed to 1
set.seed(1, sample.kind="Rounding")
sample_size <- 25
X <- sample(x = x, size = sample_size)
mean_X <- mean(X)
mean_X

### set the seed to 1
set.seed(1, sample.kind="Rounding")
sample_size <- 25
Y <- sample(x = y, size = sample_size)
mean_Y <- mean(Y)
mean_Y

#ex7
diff_y_x <- mean(y) - mean(x)
diff_Y_X <- mean_Y - mean_X
abs_diff <-  abs(diff_y_x - diff_Y_X)
abs_diff