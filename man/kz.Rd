\name{kz}
\alias{kz}
\title{Kolmogorov-Zurbenko filter}
\description{
  Kolmogorov-Zurbenko low-pass linear filter.
}
\details{
  KZ is an iterated moving average. The filter can be used with missing values. One iteration is equivalent to a simple moving average. Three iterations is an approximately Gaussian shaped filter.
}
\usage{
kz(x, m, k = 3)
}
\arguments{
  \item{x}{The raw data that will be smoothed. The data can have as many as 3 dimensions. KZ will also handle a time series.}
  \item{m}{Window size for the filter. This can be up to 3 dimensions, but not more than the dimensionality of the input data x.}
  \item{k}{Number of iterations.}
}
\references{
  Zurbenko, I. G., 1986: The spectral Analysis of Time Series. North-Holland, 248 pp.
}
\examples{
## 2 dimensions
set.seed(2)
a <- matrix(rep(0,100*100),nrow=100)
a[35:70,35:70]<-1
a <- a + matrix(rnorm(100*100,0,1),nrow=100)

z<-kz(a,m=c(20,5),k=3)
x <- seq(1,100)
y <- x
op <- par(bg = "white")

c="lightblue"
m="Unsmoothed"
persp(x, y, a, zlab="a", ticktype="detailed", theta = 60, phi = 45, col = c, main=m)

m="KZ(a,m=c(20,5),k=3)"
persp(x, y, z, zlab="z", ticktype="detailed", theta = 60, phi = 45, col = c, main=m)

#example
t <- seq(0,20,length=20*365)
set.seed(6); e <- rnorm(n = length(t), sd = 2.0)
y <- sin(3*pi*t) + e
z <- kz(y,30)

par(mfrow=c(2,1))
plot(y,ylim=c(-5,5),type="l",main="y = sin(3*pi*t) + noise")
plot(z,ylim=c(-5,5), type="l",main="KZ filter")
lines(sin(3*pi*t), col="blue")
par(mfrow=c(1,1))
}
\keyword{kz}
