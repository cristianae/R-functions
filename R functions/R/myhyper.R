#' Hypergeometric function
#'
#' @param iter this is the number of iterations
#' @param N the total number in a population
#' @param r the number of successful items
#' @param n the sample size
#'
#' @return a barplot of the proportions
#' @export
#'
#'
#' @importFrom graphics barplot
#' @importFrom grDevices rainbow
#'
#' @examples
#' myhyper(iter=100,N=20,r=12,n=5)
myhyper=function(iter=100,N=20,r=12,n=5){
  # make a matrix to hold the samples
  #initially filled with NA's
  sam.mat=matrix(NA,nrow=n,ncol=iter, byrow=TRUE)
  #Make a vector to hold the number of successes over the trials
  succ=c()
  for( i in 1:iter){
    #Fill each column with a new sample
    sam.mat[,i]=sample(rep(c(1,0),c(r,N-r)),n,replace=FALSE)
    #Calculate a statistic from the sample (this case it is the sum)
    succ[i]=sum(sam.mat[,i])
  }
  #Make a table of successes
  succ.tab=table(factor(succ,levels=0:n))
  #Make a barplot of the proportions
  barplot(succ.tab/(iter), col=rainbow(n+1), main="HYPERGEOMETRIC simulation", xlab="Number of successes")
  succ.tab/iter
}
