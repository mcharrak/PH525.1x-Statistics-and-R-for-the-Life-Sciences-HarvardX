# week 4 notes lecture exploratory data analysis

#### install package if necessary ####
# install.packages("UsingR")
library(UsingR)
x  <- father.son$fheight
## --------------------------------------------
round(sample(x,20),1)
## --------------------------------------------
x_min <- floor(min(x))
x_max <- ceiling(max(x))
fig_title <- "Height Histogram"
x_label <- "Height in inches"
hist(x,breaks = seq(x_min, x_max), main = fig_title, xlab = x_label)
## here 'break' tells the plotting function 'hist' where to draw intervals
## --------------------------------------------
xs <- seq(from = x_min, to = x_max, by = 0.1)
x_label <- "Height in inches"
y_label <- "F(x)"
plot(xs,ecdf(x)(xs), type = "l", xlab = x_label, ylab = y_label)
## --------------------------------------------
mean_x <- mean(x)
sigma_x <- sd(x)

### let us use the normal dist. approximation for the height distribution data
### task: how much % of data is > 70inches
#1) empirical result
mean(x>70)
#2) theoretical result
1-pnorm(70,mean = mean_x, sd = sigma_x)

### task: how much % of data is > 63inches
#1) empirical result
mean(x>63)
#2) theoretical result
1-pnorm(63,mean = mean_x, sd = sigma_x)

#### we can plot above experiment systematically for many values of x
### 1) create quantiles/percentiles of the data distribution
ps <- seq(0.01,0.99,0.01)
qs <- quantile(x,ps)
### 2) create compute quantiles/percentiles for the normal dist.
normal_qs <- qnorm(p = ps, mean = mean_x, sd = sigma_x)
plot(normal_qs,qs,xlab="Normal percentiles",ylab="Height percentiles")
abline(0,1)
## --------------------------------------------
#easier with R functionality which meakes the above plot automatically
qqnorm(x)
qqline(x)