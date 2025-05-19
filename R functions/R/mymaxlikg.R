#' Maximum Likelihood
#'
#'This function computes the maximum likelihood estimate for a given likelihood function over a range of theta values.
#' @param lfun A likelihood function to be evaluated
#' @param theta numeric vector
#'
#' @return The `theta` value corresponding to the maximum likelihood
#' @export
#'
#' @examples
#' logbin2=function(theta){log(dbinom(1,prob=theta,size=2)) + log(dbinom(7,prob=theta,size=8))}
#' mymaxlikg(theta=seq(0,1,length=10000), lfun=logbin2)
mymaxlikg=function(lfun="logbin2",theta) { # default log lik is a combination bin
  nth=length(theta)  # nu. of valuse used in theta
  thmat=matrix(theta,nr=nth,nc=1,byrow=TRUE) # Matrix of theta
  z=apply(thmat,1,lfun) # z holds the log lik values
  zmax=max(which(z==max(z)))  # finding the INDEX of the max lik
  plot(theta,exp(z),type="l") # plot of lik
  abline(v=theta[zmax],col="Blue")   #  verical line through max
  axis(3,theta[zmax],round(theta[zmax],4))  # one tick on the third axis
  theta[zmax]   # theta corresponding to max lik
}

