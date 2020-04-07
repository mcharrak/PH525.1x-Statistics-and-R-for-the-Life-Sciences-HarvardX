# week 1 code for dplyr exercise

library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)

#ex1
dat <- read.csv("msleep_ggplot2.csv")
class(dat)
#ex2
dat_Primates <-  filter(dat, order == "Primates")
n_Primate <- nrow(dat_Primates)
n_Primate
#ex3
class(dat_Primates)
#ex4
dat_Primates_sleep <- filter(dat, order == "Primates") %>% select(sleep_total)
class(dat_Primates_sleep)
#ex5
vec_dat_Primates_sleep <- unlist(dat_Primates_sleep)
mean_Primates_sleep <- mean(vec_dat_Primates_sleep)
mean_Primates_sleep
#ex6
mean_Primates_sleep <- summarise(dat_Primates,mean = mean(sleep_total))
mean_Primates_sleep