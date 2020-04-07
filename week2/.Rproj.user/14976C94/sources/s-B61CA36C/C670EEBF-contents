# week 2 code for probability distributions exercise

### install data set Gapminder which is also an R-package
#install.packages("gapminder")

library(gapminder)
data(gapminder)
head(gapminder)

gapminder_liefExp_1952 <- gapminder[which(gapminder$year==1952),"lifeExp"]
x <- unlist(gapminder_liefExp_1952)
hist(x)

#ex1
prop_leq_to_40years <-  mean(x <= 40)
prop_leq_to_40years

#ex2
prop_leq_to_60years <- mean(x <= 60)
prop_meq_to_40years_AND_leq_to_60years <- prop_leq_to_60years - prop_leq_to_40years
prop_meq_to_40years_AND_leq_to_60years

#ex3 (optional)
prop = function(q) {
  mean (x <= q)
}
prop(40)

qs = seq(from=min(x),to=max(x),length = 20)
qs

props = sapply(qs,prop)
props

### have a look at the results with a plot
plot(qs,props)

### or equivalentely as a one liner
props = sapply(qs,function(q) mean(x <= q))
plot(qs,props)

### this is equivalent to use the pre-built ecdf function of R
plot(ecdf(x))