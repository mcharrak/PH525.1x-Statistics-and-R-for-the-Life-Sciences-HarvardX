# week 3 T-test exercises

library(downloader)
library(dplyr) ### is needed to use piping technique e.g. %>%
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist()
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist()

library(rafalib)
diff_sample_means <- mean(bwt.nonsmoke) - mean(bwt.smoke)
cat(sprintf("Difference between the 2 group's mean is: %f.",diff_sample_means))

popsd_nonsmoke <- popsd(bwt.nonsmoke)
cat(sprintf("Population SD for 'nonsmoking babies' is: %f", popsd_nonsmoke))
popsd_smoke <- popsd(bwt.smoke)
cat(sprintf("Population SD for 'smoking babies' is: %f", popsd_smoke))

#ex1
set.seed(1, sample.kind = "Rounding")
sample_size <- 25
dat.ns <- sample(x = bwt.nonsmoke,size = sample_size)
dat.s <- sample(x = bwt.smoke,size = sample_size)
diff <- mean(dat.ns) - mean(dat.s)
diff

### calculate the SE for the RV which describes the diff between both group's RV

### from statistical theory we know that: for independent random variables X and Y, 
### the variance of their sum or difference (X+Y or X-Y) is the sum of their variances (var_X+var_Y)=:
var_of_diff_RV <- var(dat.ns) + var(dat.s)
std_of_diff_RV <- sqrt(var_of_diff_RV)

n <- sample_size

SE_diff <- std_of_diff_RV / sqrt(n)
tval <- diff/SE_diff
tval

#ex2

area_right_tail <- 1 - pnorm(tval)
area_left_tail <- pnorm(-tval)
prop_two_sides <- area_right_tail + area_left_tail
prop_two_sides

### alternatively p= 1 - area_until_upper_bound = area_until_lower_bound
prop_two_sides <- 1 - pnorm(tval) + pnorm(-tval)
prop_two_sides

#ex4

### we need to determine the +/- 3std interval around our estimate mean(dat.s) - mean(dat.ns)
### above we already determined the variance of that difference in means

n <- sample_size
# step1: calculate exact Q-value
Q <- qnorm(1 - 0.01/2)
# step2: calculate std of the random variable (diff_RV)
sd_s <- sd(dat.s)
sd_ns <- sd(dat.ns)
var_diff_RV <- (sd_s/sqrt(n))^2 + (sd_ns/sqrt(n))^2
std_diff_RV <- sqrt(var_diff_RV)
interval_value <- Q*std_diff_RV
interval_value
