#' Display P-value areas
#' the function calculates the p-value, displays the corresponding t-distribution, and gives the graph with the p-value areas.
#'
#' @param t0 Numeric. The observed t-statistic.
#' @param xmax  Numeric. The range of x-axis values to display, it's set to 4.
#' @param n Integer. This is the sample size, set to 20.
#' @param alpha Numeric. Significance level for the test, set to 0.05.
#'
#' @return A list containing the critical value q and p-value along with the graph showing the area of the p-value.
#' @export
#'
#' @examples
#' mypvalue(t0 = 2, xmax = 4, n = 30, alpha = 0.05)
mypvalue=function(t0,xmax=4,n=20, alpha=0.05){
  #calculate alpha/2
  va=round(pt(-t0,df=n-1),4)
  pv=2*va

  # plot the t dist
  curve(dt(x,df=n-1),xlim=c(-xmax,xmax),ylab="T Density",xlab=expression(t),
        main=substitute(paste("P-value=", pv, " alpha=", alpha)))


  # set up points on the polygon to the right
  xcurve=seq(t0,xmax,length=1000)
  ycurve=dt(xcurve,df=n-1)

  # set up points to the left
  xlcurve=seq(-t0,-xmax,length=1000)
  ylcurve=dt(xcurve,df=n-1)

  # Shade in the polygon defined by the line segments
  polygon(c(t0,xcurve,xmax),c(0,ycurve,0),col="green")
  polygon(c(-t0,xlcurve,-xmax),c(0,ylcurve,0),col="green")

  # make quantiles
  q=qt(1-alpha/2,n-1)
  abline( v=c(q,-q),lwd=2) # plot the cut off t value
  axis(3,c(q,-q),c(expression(abs(t[alpha/2])),expression(-abs(t[alpha/2]))))


  # Annotation
  text(0.5*(t0+xmax),max(ycurve),substitute(paste(area, "=",va)))
  text(-0.5*(t0+xmax),max(ycurve),expression(area))

  return(list(q=q,pvalue=pv))
}
