# week 2 code for central limit theorem (CLT) exercise

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

#ex1

### if we assume z-scored values, then default of mean=0 and std=1 are used for pnorm
upper_area <-  pnorm(1)
lower_area <-  pnorm(-1)
area_within_1std <-upper_area - lower_area
area_within_1std

#ex2

upper_area <-  pnorm(2)
lower_area <-  pnorm(-2)
area_within_2std <-upper_area - lower_area
area_within_2std

#ex3

upper_area <-  pnorm(3)
lower_area <-  pnorm(-3)
area_within_3std <-upper_area - lower_area
area_within_3std

#ex4

y <- filter(dat, Diet=="chow" & Sex=="M") %>% select(Bodyweight) %>% unlist()
mean_y <- mean(y)
std_y <- popsd(y)
upper_bound_1std <-  mean_y + std_y
lower_bound_1std <- mean_y - std_y
prop_y_in_1std_interval <- sum(y > lower_bound_1std & y < upper_bound_1std)/length(y)
prop_y_in_1std_interval

### alternatively we can first z-score our data and then check how many observations are within +-1std 
z_scores <- (y - mean_y) / std_y
prop_y_in_1std_interval <- mean( abs(z_scores) <= 1)
prop_y_in_1std_interval

#ex5
prop_y_in_2std_interval <- mean( abs(z_scores) <= 2)
prop_y_in_2std_interval

#ex6
prop_y_in_3std_interval <- mean( abs(z_scores) <= 3)
prop_y_in_3std_interval

#ex7

### now let us compare all quantiles using a Q-Q plot (qqplot)
mypar(1,1)
qqnorm(z_scores)
abline(0,1)

#ex8

### for subplots in a 2x2 grid
mypar(2,2)
y1 <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist()
z1 <- ( y1 - mean(y1) ) / popsd(y1)

y2 <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist()
z2 <- ( y2 - mean(y2) ) / popsd(y2)

y3 <- filter(dat, Sex=="M" & Diet=="hf") %>% select(Bodyweight) %>% unlist()
z3 <- ( y3 - mean(y3) ) / popsd(y3)

y4 <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist()
z4 <- ( y4 - mean(y4) ) / popsd(y4)

qqnorm(z1);abline(0,1)

qqnorm(z2);abline(0,1)

qqnorm(z3);abline(0,1)

qqnorm(z4);abline(0,1)

#ex9
n <- 10000
sample_size <- 25
y <- filter(dat, Diet=="chow"& Sex=="M") %>% select(Bodyweight) %>% unlist()
### set the seed to 1
set.seed(1, sample.kind="Rounding")
avgs <- replicate(n, mean( sample(y,sample_size) ))

qqnorm(avgs)
qqline(avgs)

mean_avgs = mean(avgs)
mean_avgs

#ex10

sd_avgs = popsd(avgs)
sd_avgs