---
title: Statistics Tutorial on Null Hypothesis distribution
author: Amine M'Charrak
layout: post
date: 2019-12-07 4:00:00
---

#### Null Distribution
The null distribution is a probability distribution. When the null hypothesis () is true, then the null distribution is the probability distribution of the test statistic. The null distribution is the distribution of two sets of data (e.g. sample with placebo vs. sample with treatment) under a null hypothesis.

#### What is the p-value?
Answer to the question:  
What is the probability that an outcome from the null distribution is bigger than what we have observed, when the null hypothesis is true.   
For example, from our training data by comparing a treatment group with a placebo/control group). The standard p-value refers to the absolute difference between two groups, which means it is two-sided!

#### Empirical (cumulative) distribution function (CDF):

The empirical distribution function is an estimate of the population-CDF based on the sample. The empirical CDF usually approximates the CDF quite well.  
The empirical CDF is a function $F(a)$ (for $a \in \R$), which tells use the proportion of the values in our sample that are less than or equal to $a$.

#### Normal distribution

+ Mean $\mu$: *equals* the average.
+ Variance $\sigma^2$: *equals* standard deviation ()$\sigma$) squared.
+ Standard deviation $\sigma$: *equals* to the average distance from the mean $\mu$.

*Standardized units (converting data into z-scores)*
*Iff* data $X$ is approximately normal, then we can convert the data to standard units
by
1) subtracting the sample mean $\bar{X}$ from each data point
2) dividing the result by the sample standard deviation $s_X$

such that:

$$
Z_i = \frac{X_i - \bar{X}}{s_X}
$$

where Z will now follow the **standard** normal distriubtion $\mathcal{N}(\mu = 0, \sigma^2 = 0)$.
When our data is converted to **z-scores**, we no longer have to think about units.


#### Q-Q (Quantile-Quantile) plot

**Question: Does our data follow a XYZ distribution?**
&rarr; A Q-Q plot can help to answer this question.

A Q-Q plot is a probability plot for comparing two probability distributions by plotting their quantiles against each other.  

This is how we build a Q-Q plot:

1) Give each data point from your dataset an own quantile. E.g., for a dataset of size $n$, we will have $n$ quantiles.
2) Divide your XYZ distribution into $n$ equally sized areas. I.e., add the same number of quantiles to the XYZ distribution curve as you created for the data.
3) Plot the Q-Q graph, which has two axes.  


    3.1. *DATA QUANTILES*
    The ordinate axis (Y-axis) is for the quantiles from the dataset.
    3.2. *DISTRIBUTION QUANTILES*
    The abscissa axis (X-axis) is for the quantiles from the distribution.

4) Each point $(x,y)$ in the Q-Q plot refers to one of the $n$ different quantiles. These points do not need to be observed as pairs (e.g. as in a scatter plot) and they also do not need to contain the same number of data points (e.g. when comparing two datasets $\mathcal{D}_1$, $\mathcal{D}_2$ from two distributions), in which case we choose the number of points in our Q-Q plot, $n$, to be $min(\vert\mathcal{D}_1\vert,\vert\mathcal{D}_2\vert)$.
First, we look up the data quantiles from 1 to $n$ which will serve as our $x$ coordinate.  
Next, we look up the XYZ distribution quantiles from 1 to $n$ which will serve as our $y$ coordinate.   
Finally, we plot the coordinates $(x,y)$ as a point in our Q-Q plot.


If the two distributions being compared are similar, the points in the Q-Q plot will approximately lie on the line $y = x$. If the two distributions are linearly related, then the points in the Q-Q plot will approximately lie on a line, but not necessarily on the line $y=x$.

A Q-Q plot is used to compare the shapes of distributions because it provides a graphical view of how properties such as
- location
- scale or
- skewness  

are similar or different in the two distributions. For example, Q–Q plots are often used to compare a data set to a theoretical model. Such as comparing if the dataset follows a normal distribution $\mathcal{N}(\mu, \sigma)$ with the mean $\mu$ and standard deviation $\sigma$.

A Q–Q plot is generally a more powerful approach to compare two samples of data than the common technique of comparing histograms of the two samples

The more samples $n$ our dataset contains, the more points our Q-Q plots will have because each point corresponds to a single quantile.

#### Quantiles and Percentiles

For example, the *median* is a quantile because it splits the data into equal sized groups. It is called the 50% quantile.  

The 25% quantile mark equals to the data point value for which 25% of the data points are smaller than it.

The 75% quantile mark equals to the data point value for which 75% of the data points are smaller than it.

--> In general, quantiles are just the marks/lines that divide the data in to equally sized groups. It is common to have the following quantiles:
* Q1: 1st quantile equals 25th percentile
* Q2: 2nd quantile equals 50th percentile
* Q3: 3rd quantile equals 75th percentile
* Q4: 4th quantile equals 100th percentile

The $n$-th percentile is the scalar value of a specific sample in your dataset $\mathcal{D}$.

**Therefore, percentiles are just quantiles, that divide the data into 100 equally sized groups.**

So, we can call the median also the 50th percentile.
Let us assume we have 15 data points. Then the
- zeroth data point will be the (0/15) = 0% quantile (or the 0th percentile)
- third data point will be the (3/15) = 20% quantile (or the 20th percentile)
- etc.

#### Statistical inference
**Goal:**
Answering a question about the population by looking just at a few random samples.

Therefore, the ultimate goal is to determine population statistics (e.g. mean $\mu_X$, standard deviation). For this, we take a sample $\{X_1, \dots, X_M\}$. Then, we can take the sample average $\bar{X}= \frac{1}{M} \sum_{i=1}^{M} X_i$.

&rarr; We want to know: "How far is the sample-mean $\bar{X}$ from the population-mean $\mu_X$?".

#### Central Limit Theorem (CLT)

The CLT states that the sample average $\bar{X}$ follows a normal distribution s.t. $\bar{X} \sim \mathcal{N}(\mu_X, \frac{\sigma_X}{\sqrt{M}})$. Here, $M$ denotes the sample size, $\mu_X$ refers to the population mean, and $\sigma_X$ refers to the population standard deviation. The **standard deviation** gibes us an idea of how much the population varies around the mean.

Remark:  
The sample average $\bar{X}$ is a random variable (RV).

The larger our sample size $M$, the smaller will be the "spread for the distribution of the RV $\bar{X}$, which is due to the standard deviation identity: $\frac{\sigma_X}{\sqrt{M}}$. We can see that as $M \to \infty$, the standard deviation diminishes.

#### t-statistics and the CLT

 Using the t-distribution makes the assumption, that the data we have is normally distributed. I.e. if we would have access to the entire population and plot it, then we would see roughly a normal distribution.

 The CLT is affected by the sample size, which must be appropriately large enough. Moreover, if the event of interest (e.g. binary data with $p(X=0) \gg  p(X=1)$) has very low probability, then we also need larger samples sizes for the CLT to become "valid".

 CLT provides an approximation for cases in which the sample size is large (i.e. we get to sample many sample-means but in reality we only get to see one dataset (a single sample-mean $\bar{X}$).

 ***One way*** to calculate the p-value with the t-statistic is to use the **CLT criteria**, which assumes that the sample size is large enough. However, there is ***another way*** to determine the p-value which only assumes that the **distribution of the population is approximately normal**; in which case the t-statistic follows the *t-distribution*.

Given two groups of RVs, $X$ and $Y$, with sample means $\bar{X}$ and $\bar{Y}$ and variances $\sigma_X^2$ and $\sigma_Y^2$. Then a new random variable $Z =(\bar{X} - \bar{Y})$ will have a variance $\sigma_Z^2$ which is equivalent to the sum of each RVs variance such that $\sigma_Z^2 = \sigma_X^2 + \sigma_Y^2$  . The same applies to the summation of two RVs, e.g. when $Z =(\bar{X} + \bar{Y})$.


#### Confidence Intervals

The definition of the C% confidence interval is:  

**C% of random intervals will contain the true fixed value that we are trying to estimate (often population mean $\mu_X$)**

NOTE: It is the interval (interval borders) that is a RV and NOT the estimate (fixed value) itself.

Only reporting the p-value does not include any information about estimated *effect size*; the effect size is for instance the observed difference between

- two sample means or
- one sample mean and the population mean.

The confidence interval provides us with information about the estimated effect size as well as the uncertainty of this estimate.

Often, this estimate will be the population mean $\mu_X$ which we are trying to estimate using the sample data $X$ with sample mean $\bar{X}$ of $N$ observations. In this case, be aware, that the upper and lower values of the interval are random and NOT the estimated value $\mu_X$ itself.  
The lower interval bound is: $\bar{X}-2*SE_x$
The upper interval bound is: $\bar{X}+2*SE_x$.
Here, $SE_x$ denotes the standard error which is derived from the sample variance $s_X$ and the sample size $N$ as follows:
$$
SE_x = \frac{s_X}{\sqrt{N}}
$$


#### Type I error and Type II error

***1) Type I error:***  
Probability of rejecting ($R$) the null hypothesis $H_0$, when $H_0$ is in fact true: $P(R\vert H_0)$. This probability is also called **significance level $\alpha$**.
***2) Type II error:***
Probability of *not* rejecting ($\bar{R}$) the null hypothesis $H_0$, when $H_0$ is in fact false: $P(\bar{R} \vert \bar{H_0})$. Which means, that we fail to reject the null hypothesis $H_0$, when the alternative hypothesis $H_a$ is true. *Power* is one minus Type II error rate; also often called *sensitivity*.

**Setting a lower $\alpha$ decreases the power of the hypothesis test** because the null hypothesis will be more difficult to reject. This is because when $\alpha$ decreases, then in order for the "confusion matrix" (containing TP, FP, TN, and FN) to remain correct, the other off-diagonal entry has to increase; which in this case would be the type II error rate. Hence, we conclude:

$\alpha$ ($\downarrow$) $\longrightarrow$ type-II error ($\uparrow$)  $\longrightarrow$ power($\downarrow$)

because of the relationship: power = 1 - type-II error. Consequently, this means that the power of a hypothesis test trades off with the Type I error rate. So, one cannot achieve simultaneously a small Type I error rates and a small Type II error rate.

#### Statistical power

It is very likely to make a type II error when we have a small sample size $N$. And power helps to quantify this issue because **statistical power** is the probability of __**not making a type II error**__; in effect rejecting the null hypothesis $H_0$ when the null hypothesis is false: $P(R \vert \bar{H_0})$.

The statistical power $P(R \vert \bar{H_0})$ of a test increases as the sample size $N$ grows.

Calculating the power for different sample sizes $N$ is important in order to be able to detect a significant difference when in fact there is one.

Hence, we have a tool to determine what sample size is needed to achieve a large enough testing power, which will help us to reduce the sampling costs e.g. participants in a survey or animal experiments - which is often ethical to do in order to reduce the ethical damage of our experiments.


#### Monte Carlo Simulation

Monte Carlo simulation refers to the process of generating random variables (RV) using a computer.

For large sample size $N$, the CLT starts to be effective and the t-statistic distribution can be well approximated with a standard normal distribution $\mathcal{N}(\mu = 0, \sigma^2 = 1)$. Furthermore, the t-distribution (with df = $N-1$) and the standard normal distribution $\mathcal{N}(0, 1)$ are practically the same for very large sample size $N$.
