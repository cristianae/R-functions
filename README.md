# R-functions
This program consists of R functions that compute statistical concepts such as confidence intervals, p-values, maximum likelihood estimation, and optimal overbooking thresholds. This was created for my (Applied Statistical Methods) course. 

## Author:
Cristiana Eagen

## Built With:
- R
- R packages: stats, graphics, grDevices

## Functions:
- `ntickets.R`: This function calculates the number of tickets to be sold when the number of seats in the flight is N and the probability of a "show" is p and gamma is the probability a plane will be truly overbooked (more people show than there are seats).
- `myhyper.R`: Takes random samples and makes a barplot of successes.
- `mymaxlikg.R`: This function computes the maximum likelihood estimate for a given likelihood function over a range of theta values.
- `mycltp.R`: This function demonstrates the Central Limit Theorem. It gets random samples from a Poisson distribution, calculates the sample means, and generates histograms of these means. It also compares the sample distribution to a theoretical normal distribution and includes a bar plot of the sampled Poisson values.
- `mypvalue.R`: This function calculates the p-value, displays the corresponding t-distribution, and gives the graph with the p-value areas.
- `myci.R`: This function calculates a (1 - alpha) * 100% confidence interval for the mean of a single sample.
- `myncurve.R`: Displays a normal curve, shades the area from −∞ to a given x-value, and returns the probability P(X ≤ a).

## How to run the code:
- Clone this repository
- Load individual .R files into RStudio.
- Call the functions using example values.

## Example:
ntickets(N = 400, gamma = 0.02, p = 0.95)
