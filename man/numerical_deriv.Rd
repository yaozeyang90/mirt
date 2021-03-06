% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{numerical_deriv}
\alias{numerical_deriv}
\title{Compute numerical derivatives}
\usage{
numerical_deriv(par, f, ..., delta = 1e-05, gradient = TRUE,
  type = "forward")
}
\arguments{
\item{par}{a vector of parameters}

\item{f}{the objective function being evaluated}

\item{...}{additional arguments to be passed to \code{f} and the \code{numDeriv} package when the
Richardson type is used}

\item{delta}{the term used to perturb the \code{f} function. Default is 1e-5}

\item{gradient}{logical; compute the gradient terms? If FALSE then the Hessian is computed instead}

\item{type}{type of difference to compute. Can be either \code{'forward'} for the forward difference,
\code{'central'} for the central difference, or \code{'Richardson'} for the Richardson extropolation.
Backword difference is acheived by supplying a negative \code{delta} value}
}
\description{
Compute numerical derivatives using forward/backword difference,
central difference, or Richardson extropolation.
}
\examples{

\dontrun{
f <- function(x) 3*x[1]^3 - 4*x[2]^2
par <- c(3,8)

# grad = 9 * x^2 , -8 * y
(actual <- c(9 * par[1]^2, -8 * par[2]))
numerical_deriv(par, f, type = 'forward')
numerical_deriv(par, f, type = 'central')
numerical_deriv(par, f, type = 'Richardson')

# hessian = h11 -> 18 * x, h22 -> -8, h12 -> h21 -> 0
(actual <- matrix(c(18 * par[1], 0, 0, -8), 2, 2))
numerical_deriv(par, f, type = 'forward', gradient = FALSE)
numerical_deriv(par, f, type = 'central', gradient = FALSE)
numerical_deriv(par, f, type = 'Richardson', gradient = FALSE)

}
}
\author{
Phil Chalmers \email{rphilip.chalmers@gmail.com}
}
\keyword{derivatives}
\keyword{numerical}
