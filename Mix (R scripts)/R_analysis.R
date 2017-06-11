################# Quiz 2

## Question 4
rnorm(1, 1100, 75)
?quantile

1100 + c(-1, 1) *qnorm(.95) * 75/sqrt(1)

## Question 5
1100 + c(-1, 1) *qnorm(.95) * 75/sqrt(100)

################# Quiz 4

## Question 1
pt(-, df=99)
ppois(11, )

## Question 2
2 * pt(-2.261646358, df=4)

## Question 4
pnorm(-1)
#### Attempt 3:
choose(4, 3) * .5 ^ 4 + choose(4,4)*.5^4
pbinom(2, size=4, prob=.5, lower.tail=FALSE)

## Question 5
pnorm(-1.871091828)

## Question 6
pt(-6.6057826, df=16)

## Question 8:
power.t.test(n = 100, delta = 0.01, sd=0.04, type = "one.sample", alt = "one.sided")$power

## Question 9:
power.t.test(power=.9, delta = 0.01, sd=0.04, type = "one.sample", alt = "one.sided")$n

## Question 11:
2 * pt(-1.96, df=574)

