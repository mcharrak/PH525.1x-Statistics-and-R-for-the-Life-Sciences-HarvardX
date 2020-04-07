#### week 4 lecture notes scatterplot

data("father.son")
x <- father.son$fheight
y <- father.son$sheight
plot(x, y, xlab = "Father's height in inches", ylab = "Son's height in inches")
# lets stratify the data by father size mesaured in integer
boxplot(split(y,round(x)))
# lets calculate the mean of son heights 
# for father with rounded height of 72 inches
print(mean(y[round(x) == 72]))

# let us standardize the data
x <- (x-mean(x))/sd(x)
y <- (y-mean(y))/sd(y)

# calculate mean for each strata
means <- tapply(y, round(x*4)/4, mean)
fatherheights <- as.numeric(names(means))
plot(fatherheights, means, xlab = "fatherheights", 
     ylab = "avg of strata of son heights")
abline(0,cor(x,y))

# final experiment with uncorrelated data
a <- rnorm(100);a[1] <- 25
b <- rnorm(100);b[1] <- 26
plot(a,b,main=paste("correlation =",signif(cor(a,b),2)))
### FROM THE PLOT ABOVE WE CAN SEE THAT THE CORRELATION IS VERY HIGH
### EVENTHOUGH THE DATA IS NOT CORRELATED. THE REASON FOR THAT IS THE
### OUTLIER AT (a,b) = (25,26)
cor(a,b,method = "spearman")

