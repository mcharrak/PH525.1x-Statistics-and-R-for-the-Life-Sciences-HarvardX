### week 4 Mann-Whitney-Wilcoxon Test exercises

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


#ex1
# day 4 weights diet 1
x <- filter(chick, Diet == 1) %>% select("weight.4") %>% unlist()
# day 4 weights diet 4
y <- filter(chick, Diet == 4) %>% select("weight.4") %>% unlist()

# alternatively acess data with
# x <- chick$weight.4[chick$Diet == 1]
# x <- chick$weight.4[chick$Diet == 1]

# t-test
ttest <- t.test(x,y)
# wilcox test
wtest <- wilcox.test(x,y)
# add outlier
x_with_outlier <- c(x,200)
ttest_pval_outlier <- t.test(x_with_outlier,y)$p.value
ttest_pval_outlier

#ex2
wtest_pval_outlier <- wilcox.test(x_with_outlier,y)$p.value
wtest_pval_outlier

#ex3
library(rafalib)
mypar(1,3)
boxplot(x,y)
boxplot(x,y+10)
boxplot(x,y+100)

ttest1 <- t.test(x,y+10)$statistic
ttest2 <- t.test(x,y+100)$statistic
diff_ttests <- ttest1 - ttest2
diff_ttests

wtest1 <- wilcox.test(x,y+10)$statistic
wtest2 <- wilcox.test(x,y+100)$statistic
diff_wtests <- wtest1 - wtest2
diff_wtests

#ex4
v1 <- c(1,2,3)
v2 <- c(14,5,6)
wtest_pval1 <- wilcox.test(v1,v2)$p.value
wtest_pval1

#ex5
v3 <-  100*v2
wtest_pval2 <- wilcox.test(v1,v3)$p.value
wtest_pval2