#' Confidence Interval for the mean
#'
#' calculates a (1 - alpha) * 100% confidence interval for the mean
#' of a single sample
#'
#' @param x A numeric vector that is the sample data
#' @param conf.level A numeric value between 0 and 1 specifying the confidence level. Default is 0.95
#'
#' @return vector with lower and upper bounds of the confidence interval
#' @export
#'
#' @examples
#' set.seed(23);x = rnorm(30,mean=10,sd=12)
#' myci(x)

myci <- function(x, conf.level = 0.95) {

  mean <- mean(x)
  sd <- sd(x)
  n <- length(x)

  #  t-value for the 95% CI
  alpha <- 1 - conf.level
  t_value <- qt(1 - alpha / 2, df = n - 1)

  # Calculate the margin of error
  margin_error <- t_value * (sd / sqrt(n))

  # confidence interval
  ci_lower <- mean - margin_error
  ci_upper <- mean + margin_error

  return(c(lower = ci_lower, upper = ci_upper))
}
