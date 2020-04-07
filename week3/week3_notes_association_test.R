# week3 notes association tests

tab <- matrix(data=c(3,1,1,3), nrow = 2, ncol = 2)
rownames(tab) <- c("Poured Before", "Poured After")
colnames(tab) <- c("Guessed Before", "Guessed After")
tab

fisher.test(tab,alternative = "greater")

#####

disease=factor(c(rep(0,180),rep(1,20),rep(0,40),rep(1,10)),
               labels=c("control","cases"))
genotype=factor(c(rep("AA/Aa",200),rep("aa",50)),
                levels=c("AA/Aa","aa"))
dat <- data.frame(disease,genotype)
dat <- dat[sample(nrow(dat)),] #shuffle dat to make the data null distributed
head(dat)

# generate the 2 by 2 contingency table
tab <- table(genotype,disease)
tab

##         disease
## genotype control cases
##  AA/Aa     180    20
##  aa         40    10
##


### calculate odds ratio (ratio1/ratio2)
ratio1 <- tab[2,2]/tab[2,1] # 10/40
ratio2 <- tab[1,2]/tab[1,1] # 20/180
odds_ratio <- ratio1/ratio2
odds_ratio

## under the null hypothesis (P(disease) = 1/2) the probability of disease is (#peopple with disease / #people total) 
p <- mean(disease == "cases")

### calculate the H0 hypothesis table with p
row1 <- c(1-p,p) * sum(tab[1,])
row2 <- c(1-p,p) * sum(tab[2,])
expected_tab <- rbind(row1,row2)
dimnames(expected_tab) <- dimnames(tab)
expected_tab

## compute the probability of seeing a deviation from the expected table as big as the one we saw
chisq.test(tab)$p.value

## there is no 1-to-1 relationship between the odds ratio and the p-value, to demonstrate, we increase
## the sample size by 10, which reduces the p-value significantly but keeps the odds ratio constant

cat(sprintf("p-value for initial table: %.10f.",chisq.test(tab)$p.value))
cat(sprintf("p-value for new table with sample size increased by factor 10: %.10f.",chisq.test((10*tab))$p.value))

### confidence intervals for the odd ratio
fit <- glm(disease~genotype,family="binomial",data=dat)
coeftab<- summary(fit)$coef
coeftab

### the 2nd row of the coef. tab. (coeftab)  provides the estimate of the SE and the log(odds ratio)
log_CI <- coeftab[2,1] + c(-2,2)*coeftab[2,2]
CI <- exp(log_CI)
CI