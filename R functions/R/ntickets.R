#' Ntickets
#'
#' @param N number of seats in flight
#' @param gamma is the probability a plane will be truly overbooked(people > seats)
#' @param p probability of a "show"
#'
#' @return A list containing the optimal number of tickets
#' @export
#'
#' @importFrom stats pbinom pnorm
#' @importFrom graphics layout points lines abline
#' @importFrom grDevices rainbow
#'
#' @examples
#' ntickets(N=400,gamma = 0.02, p = 0.95)
ntickets <- function(N,gamma,p) {
  # calculates the number of tickets to be sold when the number of seats in the flight is N and the probability of a "show" is p and gamma is the probability a plane will be truly overbooked (more people show than there are seats).
  #N - number of seats in flight
  #p - probability of a "show"
  #gamma - is the probability a plane will be truly overbooked(people > seats)

  # Use solely the appropriate discrete distribution
  dtreshold<- seq(N, floor(N + N/10), by = 1) #this is used to identify if its overbooking
  objective_discrete <- 1- gamma- pbinom(N, size=dtreshold, prob=p)
  #which is taken from the hint
  d_ind <- which.min(abs(objective_discrete)) #putting abs here makes the line centered
  nd <- dtreshold[d_ind]

  # Use the normal approximation
  ntreshold <- seq(N, floor(N + N/10), by = 0.001)
  mean <- ntreshold*p
  sd <- sqrt(ntreshold*p*(1 - p))
  objective_normal <- 1- gamma- pnorm(N + 0.5, mean=mean, sd=sd)
  n_ind <- which.min(abs(objective_normal)) #putting abs here makes the line centered
  nc <- ntreshold[n_ind]


  layout(matrix(1:2, nrow = 2, byrow = TRUE))
  plot(dtreshold, objective_discrete, type="p", pch = 16, xlab="n", ylab="Objective",
       main = paste("Objective Vs n to find optimal tickets sold (", round(nd, 2), ")\n",
                    "gamma = ", gamma, " N = ", N, " discrete"))
  points(dtreshold, objective_discrete, pch = 16, col = "blue")
  lines(dtreshold, objective_discrete, col = "black", lwd= .75)
  abline(h = objective_discrete[d_ind], v = nd, col = "red", lwd = 1)  # Vertical line marking nd

  # Plot normal case
  plot(ntreshold, objective_normal, type="l", xlab="n", ylab="Objective",
       main = paste("Objective Vs n to find optimal tickets sold (", round(nc, 2), ")\n",
                    "gamma = ", gamma, " N = ", N, " continuous"))

  abline(h = objective_normal[n_ind], v = nc, col = "blue", lwd = 1)  # Vertical line marking nc

  #prints a named list containing nd, nc, N, p and gamma - where nd is calculated using the discrete distribution and nc is the same calculated with normal approximation.
  return(list(nd = nd, nc = round(nc, 2), N = N, p = p, gamma = gamma))
}
