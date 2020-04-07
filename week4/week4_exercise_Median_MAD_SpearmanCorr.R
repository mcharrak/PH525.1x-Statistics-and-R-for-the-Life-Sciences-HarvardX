### week 4 Median, MAD, and Spearman Correlation exercises

# load data of chick weights over 21 days for 4 different protein diets
data(ChickWeight)
head(ChickWeight)

plot(ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)

# use reshape to change view of the data from a 'long' format with repeated values for individuals in seperate rows 
# to 'wide' format with all values of an individual within a single row 
chick <- reshape(ChickWeight, idvar = c("Chick", "Diet"), timevar = "Time", direction = "wide")
head(chick)

# remove any row that has a missing observation "NA"
chick <- na.omit(chick)

#ex0
weights_day4 <- chick[,"weight.4"]
weights_day4_with_outlier <- c(weights_day4,3000)

avg_day4 <- mean(weights_day4)
avg_day4_with_outlier <- mean(weights_day4_with_outlier)
cat(sprintf("mean of data without outlier measurement %.2f",avg_day4))
cat(sprintf("mean of data with outlier measurement %.2f",avg_day4_with_outlier))

ratio1 <- avg_day4_with_outlier/avg_day4
ratio1

#ex1
weights_day4 <- chick[,"weight.4"]
weights_day4_with_outlier <- c(weights_day4,3000)

avg_day4 <- mean(weights_day4)
avg_day4_with_outlier <- mean(weights_day4_with_outlier)
cat(sprintf("\nmean of data without outlier measurement %.2f \n",avg_day4))
cat(sprintf("\nmean of data with outlier measurement %.2f \n",avg_day4_with_outlier))

mean_ratio <- avg_day4_with_outlier/avg_day4
mean_ratio

#ex2
median_day4 <- median(weights_day4)
median_day4_with_outlier <- median(weights_day4_with_outlier)
cat(sprintf("\nmedian of data without outlier measurement %.2f \n",median_day4))
cat(sprintf("\nmedian of data with outlier measurement %.2f \n",median_day4_with_outlier))

median_ratio <- median_day4_with_outlier/median_day4
median_ratio

#ex3
sd_day4 <- sd(weights_day4)
sd_day4_with_outlier <- sd(weights_day4_with_outlier)
cat(sprintf("\nstandard deviation of data without outlier measurement %.2f \n",sd_day4))
cat(sprintf("\nstandard deviation of data with outlier measurement %.2f \n",sd_day4_with_outlier))

sd_ratio <- sd_day4_with_outlier/sd_day4
sd_ratio

#ex4
mad_day4 <- mad(weights_day4)
mad_day4_with_outlier <- mad(weights_day4_with_outlier)
cat(sprintf("\nmean absolute deviation of data without outlier measurement %.2f \n",mad_day4))
cat(sprintf("\nmean absolute deviation of data with outlier measurement %.2f \n",mad_day4_with_outlier))

mad_ratio <- mad_day4_with_outlier/mad_day4
mad_ratio

#ex5
weights_day4 <- chick[,"weight.4"]
weights_day21 <- chick[,"weight.21"]
plot(weights_day4,weights_day21)

weights_day4_with_outlier <- c(weights_day4,3000)
weights_day21_with_outlier <- c(weights_day21,3000)

corr <- cor(weights_day4,weights_day21)
corr_with_outlier <- cor(weights_day4_with_outlier,weights_day21_with_outlier)
corr_ratio <- corr_with_outlier/corr
corr_ratio