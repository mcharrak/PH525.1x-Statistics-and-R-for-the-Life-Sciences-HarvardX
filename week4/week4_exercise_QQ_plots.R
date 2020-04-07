# week 4 exercise QQ plot

### load data
load("skew.RData")
### create multi figure grid which will be filled row-by-row
par(mfrow = c(3,3))


for (i in 1:9) {
  col_data <- dat[,i]
  qqnorm(col_data)
  qqline(col_data)
}

### we can see that 2 columns are not normally distributed

### plot 4 (column data 4) has a longer tail
### plot 9 (column data 9) has a longer tail

col_4 <- dat[,4]
col_9 <- dat[,9]

### reset plot settings & plot histograms
par(mfrow=c(1,1))
hist(col_4)
hist(col_9)