### week 4 symmetry of log ratios exercise

time = sort(nym.2002$time)

fastest_time <- time[1]
median_idx <- round(length(time)/2)
median_time <- time[median_idx]

#ex1
ratio1 <- fastest_time/median_time
ratio1
#ex2
slowest_time <- time[length(time)]
ratio2 <- slowest_time/median_time
ratio2

library(rafalib)
mypar(2,1)

plot(time/median(time), ylim=c(1/4,4))
abline(h=c(1/2,1,2))

plot(log2(time/median(time)),ylim=c(-2,2))
abline(h=-1:1)