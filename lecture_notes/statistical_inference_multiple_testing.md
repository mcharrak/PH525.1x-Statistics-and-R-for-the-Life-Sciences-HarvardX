---
title: Statistical Inference and Modeling for High-throughput Experiments
author: Amine M'Charrak
layout: post
date: 2020-04-01 4:00:00
---

<!--
notes for week 1 of class in: HarvardX: PH525.3x Statistical Inference and Modeling for High-throughput Experiments
-->

### The challenge of multiple testing

Assume we have a sample of experiment participants. We will split our sample into two disjoint groups; one group is the case group receiving a treatment, the other group is the control group, which does not receive any treatment.

After the treatment has been conducted, we will measure 1000 different characteristics/features for each participant.

Now, we wish to answer which features are significantly affected by our treatment and which ones remain unaffected.

One statistical way to do this, would be multiple 2-sample t-testing for each feature between our two groups using a significance level of e.g. alpha=0.5. Let's assume that we know that our treatment has no effect on the features because we used a placebo as treatment. Unfortunately, such a statistical approach will lead to many false positives (type-1-error). This means, that we will be reporting significant p-values for some features even though the null hypothesis is true for all features (because our participants came from the same population).

Under the null hypothesis H0, ideally no p-value should be significant. However, p-values follow a uniform distribution under the null hypothesis $H_0$.

Therefore, 5% (i.e. $\alpha$ * 100) of all p-values that we calculated (here 0.05*100= 50 in total) will be <=0.05, even though theoretically we should have found that all 1000 p-values should be larger than the significance level $\alpha$ - hence forcing us to "fail to reject" the null hypothesis $H_0$.

These "false discoveries" which we computed to be significant are a common challenge when performing multiple hypothesis testing. The probability of making such a "false discovery" is called **family-wise error rate** (FWER). FWER is the probability of incorrectly rejecting the null hypothesis $H_0$ *at least once*. FWER is calculated by choosing a significance level $\alpha$ and counting how often the hypothesis test results in a p-value smaller than the significance level $\alpha$. Therefore,

$$ FWER = Pr(\#rejection - \#counts >= 1 \vert \; \forall H_0 \;true)$$
$$ = 1 - Pr(\#rejection - \#counts = 0\vert \; \forall H_0 \;true) = 1 - (1-\alpha)^m $$

where m is the total number of hypothesis tests that we run. We see that as m increases the FWER approaches 1, which means that FWER increases as the number of comparisons increases. There are two popular methods to assure that the FWER is at most $\bar{\alpha}$:

1) Bonferroni correction where
$$\alpha_{per-comparison} = \frac{\alpha}{m}$$

2) Šidák correction which can be derived as follows: If our goal is to achieve a FWER of at most $\bar{\alpha}$, then we would get $$\bar{\alpha} = 1 - (1-\alpha_{per-comparison})^m $$ for the value of FWER. Now we have to solve for $\alpha_{per-comparison}$ which gives us
$$ \alpha_{per-comparison} = 1 - (1 - \bar{\alpha})^{\frac{1}{m}} $$
Now when we use $\alpha_{per-comparison}$ instead of $\alpha$ as our significance level for each test, then we will be able to limit our FWER to the worst case value of $\bar{\alpha}$.

The Šidák method assumes that all the tests are independent, which is not always the case, e.g. in genomics where different genes do interact with each other. The Bonferroni method does not make the assumption that tests are independent.
