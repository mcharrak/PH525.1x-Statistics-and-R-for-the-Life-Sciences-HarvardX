---
title: Tutorial Exploratory Data Analysis (EDA)
author: Amine M'Charrak
layout: post
date: 2019-12-15 4:00:00
---

## Tutorial Exploratory Data Analysis (EDA)

#### Histogram

The histogram is a great visualization tool to show what the data is distributed like. It shows data ranges/intervals on the x-axis and the count of data points falling into each data range on the y-axis.

#### Empirical Cumulative Distribution Function (empirical CDF)

It reports for any given data value number $X$, the percentage of data points that are below or equal to this threshold $X$.

Using the empirical CDF, for any data value threshold $X$ , we can see how much percent of our dataset is less or equal ($\leq$) to this threshold. So, the graph shows us: $P(X \leq x)$.

#### Negative and Positive Skew

Skew tells us where the distribution has a longer tail, either on the right or on the left.

A **positive skew** means that the data distribution has a longer tail to the right because the mass of the data is located on the left.

A **negative skew** means that the data distribution has a longer tail to the left because the mass of the data is located on the right.

#### Boxplots

The boxplot shows five numbers of the data. The median which is the horizontal line in the middle of the boxplot. The borders of the box, which are the 25th and 75th percentile. Finally, the two horizontal lines at the bottom and a the top are displaying the range of the data.

#### Scatterplots

A scatterplot is a great way to summarize and visualize 2D data. The scatterplot can show us a trend about what happens in the 2nd dimension of the data when the 1st dimension of the data changes (increases/decreases); which is best summarized by the **correlation**.

If we have two data sets data are normally distributed, then the correlation is the slope of the line that you would use predict variable y given variable x.


#### Symmetry of Log Ratios

If we want to compare the difference between two groups based on some measure (e.g. average height, average expression level), then we would like that this comparison is symmetric. Such that, regardless of which group we use as a reference, the final 'difference' should be the same.

For instance, if
* group 1 (G1) has an average measured value of 32
* group 2 (G2) has an average measured value of 1

then the ratio $\frac{G2}{G1} = \frac{1}{32}$ is much bigger than if we would have used G2 as a reference by referring to the ratio $\frac{G1}{G2} = \frac{1}{32}$.

Therefore, in order to achieve a symmetric comparison tool, we can apply the *logarithm-function* onto our ratio because

$$
log(\frac{X}{Y}) = log(X) - log(Y) = -[log(Y) - log(X)] = - log(\frac{Y}{X})
$$

 In other words, if we use the log scale, 0.5*x , and 2*x, are equally far away from x.

#### Robust summary statistics: Median, Mean Average Deviation (MAD), and Spearman Correlation

Outliers heavily affect the sample average $\bar{X}$ and sample standard deviation $s_X$. One summary statistic that is not as sensitive to outliers is the **median** $median(X)$. The **MAD** is a robust estimate of the standard deviation. Another robust statistic is the **spearman correlation** as it is more robust to outliers than a simple correlation statistic.

When we say robust, we mean that the statistics are not very sensitive to erroneous measurements in our data sample.
