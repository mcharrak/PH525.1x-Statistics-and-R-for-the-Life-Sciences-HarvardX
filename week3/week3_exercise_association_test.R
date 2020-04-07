# week 3 exercise association tests

d = read.csv("assoctest.csv")

#ex1

tab <- table(d$allele, d$case)
chi_sq_test <- chisq.test(tab)
X_sq <- chi_sq_test$statistic
X_sq

#ex2

fisher_test <- fisher.test(tab)
p_val <- fisher_test$p.value
p_val