### week 4 histograms
hist(exec.pay)

# lets check if the data is normally distributed
qqnorm(exec.pay)
qqline(exec.pay)

# lets plot the data as a boxplot
boxplot(exec.pay,ylab = "10,000s of dollars", ylim = c(0,400))