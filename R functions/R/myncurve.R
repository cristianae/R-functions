#' My curve
#' instructions:	display the curve, shaded area between the curve and
#' x axis from -∞ to x=a, and calculate the area (probability, P(X<=a))
#' which is released to the command-line in a list.
#' @param mu Mean of the normal distribution
#' @param sigma Standard deviation of the normal distribution
#' @param a x-value up to which the area under the curve is shaded and the probability is calculated
#'
#' @return A list of mu, standard deviation, and probability
#' @export
#'
#' @importFrom stats dnorm pnorm
#' @importFrom graphics curve polygon
#'
#' @examples myncurve(mu = 0, sigma = 1, a = 1.5)
myncurve = function(mu, sigma, a){
  x<-NULL
  # Plot the normal distribution curve
  curve(dnorm(x, mean=mu, sd=sigma), xlim = c(mu-3*sigma, mu+3*sigma),
        main = bquote("Normal Distribution with" ~ mu == .(mu) ~ "and" ~ sigma == .(sigma)),
        ylab = "Density")

  # Fill the area under the curve from -∞ to a
  x_vals <- seq(mu - 3*sigma, a, length=100)
  y_vals <- dnorm(x_vals, mean=mu, sd=sigma)
  polygon(c(x_vals, a), c(y_vals, 0), col="pink")

  # Calculate the probability P(X <= a)
  prob <- pnorm(a, mean=mu, sd=sigma)

  # Return the probability as part of a list
  return(list(mu = mu, sigma = sigma, probability = prob))
}
