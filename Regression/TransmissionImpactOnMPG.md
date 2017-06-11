

The Impact of Transmission Type on Miles Per Gallon and Identification of Moderators
========================================================

<h2>Executive Summary</h2>

The objective of this report is to test and quantify the impact of transmission type on miles per gallon.

The reminder is divided into three main parts. First, in part A introduce all measurement variables and their coding. Second, in part B I will address the assigned research questions. Finally, in part C I will perform additional exploratory analyses based on the results of part B.

<h2>Part A. Measurement Variables</h2>

This report uses the following variables:

1. Miles per gallon (mpg) measured as numeric values.
2. Transmission type (am) measured as factors. Automatic transmission is coded as factor 0 and manual transmission is coded as factor 1.
3. Weight (wt) measured as numeric value in lb/1000.
4. Fross horsepower (hp) measured as numeric value.

<h2>PART B. Deductive Analysis</h2>

To address the assigned research question, this part suggests a hypothesis which then will be tested. The hypothesis to be tested is as follows:

<h4>H1: Transmission type influences required miles per gallon.</h4>

If the hypothesis can be confirmed at alpha=0.05 significiance interval, then the effect shall also be quantified.

<h3>1. Install and load packages</h3>

Step 1 installs and loads the required packages. As stated in the assignment, the only additional package is the package datasets which contains a variety of datasets.


```r
library(datasets)
```


<h3>2. Visualize the Impact and Define and Interpret a Suited Model</h3>

Step 2 ilustrates and defines the regression model. The figure leads to assume that there is a difference between the automatic transmission and the manual transmission (H1). While cars with automatic transmission (factor 0) only drive between ca. 10-25 miles per gallon, cars with manual transmission drive between ca. 15-34 miles per gallon.


```r
plot(as.factor(mtcars$am), as.numeric(mtcars$mpg), xlab = "Transmission Type", 
    ylab = "MPG")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


The defined model (mod1) reflects the linear regression between the transmission type (am) and the required miles per gallon (mpg). The coefficients indicate that the mean mpg for automatic transmission is 17.147 mpg and that the mean mpg for manual transmission is 17.147+7.245=24.392 mpg. That is, the mean difference between the automatic and the manual transmission is 7.245 mpg. The p-value which for testing the significance of this difference is 0.000285 and thus is smaller than 0.05. Therefore, we can reject H0 (which would assume that the means were equal) and confirm H1 at the previously set significance interval.


```r
mod1 <- lm(mpg ~ factor(am), data = mtcars)
summary(mod1)$coefficients
```

```
##             Estimate Std. Error t value  Pr(>|t|)
## (Intercept)   17.147      1.125  15.247 1.134e-15
## factor(am)1    7.245      1.764   4.106 2.850e-04
```


<h3>3. Quantify the Uncertainty</h3>

This step quantifies the uncertainty in terms of a 95% confidence interval. The result shows that with 95% confidence, a switch from automatic to manual transmission results in a 3.641 to 10.848 increase in miles per gallon.


```r
sumCoef <- summary(mod1)$coefficients
sumCoef[2, 1] + c(-1, 1) * qt(0.975, df = mod1$df) * sumCoef[2, 2]
```

```
## [1]  3.642 10.848
```


<h2>Part C: Further Exploratory Analysis to Adjust the Model</h2>

This part does some additional exploratory data analysis. In particular, it examines the following hypotheses:

<h4>H2a: Weight influences miles per gallon.</h4>
<h4>H2b: Weight moderates the impact of transmission type on required miles per gallon.</h4>
<h4>H3a: Horsepower influences miles per gallon.</h4>
<h4>H3b: Horsepower moderates the impact of transmission type on required miles per gallon.</h4>

Similar to H1, the additional hypotheses shall also be tested at alpha=0.05. The test shall be a Chi-Square test for differences of means.

<h3>4. Test of Model Adjustment</h3>

The following model reflects and tests the hypothesized moderating effects. Resulting p-values indicate that three additional hypotheses (i.e., H2a, H2b, H3a) can be confirmed.


```r
mod2 <- lm(mpg ~ factor(am) + hp + wt + factor(am) * hp + factor(am) * wt, data = mtcars)
anova(mod2, test = "Chisq")
```

```
## Analysis of Variance Table
## 
## Response: mpg
##               Df Sum Sq Mean Sq F value  Pr(>F)    
## factor(am)     1    405     405   77.51 2.8e-09 ***
## hp             1    475     475   90.96 5.6e-10 ***
## wt             1     65      65   12.46  0.0016 ** 
## factor(am):hp  1      4       4    0.74  0.3973    
## factor(am):wt  1     41      41    7.75  0.0099 ** 
## Residuals     26    136       5                    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


<h3>5. Perform Residual Diagnostics and Draw Residuals Plot</h3>

An analyses of residual is performed on mod1 and mod2 to identify the better suited model. A summary indicates that residuals of mod2 are smaller. Therefore mod2 is selected as the better suited model.


```r
e1 <- resid(mod1)
e2 <- resid(mod2)
df <- data.frame(e1, e2)
summary(df)
```

```
##        e1               e2        
##  Min.   :-9.392   Min.   :-2.987  
##  1st Qu.:-3.092   1st Qu.:-1.447  
##  Median :-0.297   Median :-0.535  
##  Mean   : 0.000   Mean   : 0.000  
##  3rd Qu.: 3.244   3rd Qu.: 1.261  
##  Max.   : 9.508   Max.   : 5.599
```


The following figure draws a residual plot of mod2. For comparison, a residual plot of mod3 is shown in the appendix.


```r
plot(e2, ylab = "Residual", main = "Residuals for Adjusted Model (mod2)")
abline(h = 0)
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 


<h3>6. Select/Built a Suited Model and Explain Selection Criteria</h3>

Since residuals are smaller for mod2, mod2 is selected. For detailes see step 5.

<h2>Appendix</h2>

```r
plot(e1, ylab = "Residual", main = "Residuals for Unadjusted Model (mod1)")
abline(h = 0)
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 

