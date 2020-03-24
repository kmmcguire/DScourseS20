set.seed(100)
X <- matrix(data = rnorm(100000 * 100), nrow = 100000, ncol = 10)
X[,1] <- 1
eps <- rnorm(100000,0,0.25)
beta <- c(1.5, -1, -0.25, 0.75, 3.5, -2, 0.5, 1, 1.25, 2)
Y = (X%*%beta) + eps
xy <- t(X)%*%Y
xxi <- solve(t(X)%*%X)
betaOLSxxxy = xxi%*%xy
library(nloptr)
## Our objective function
objfun <- function(beta,Y,X) {
  return (sum((Y-X%*%beta)^2))
  # equivalently, if we want to use matrix algebra:
  # return ( crossprod(y-X%*%beta) )
}

## Gradient of our objective function
gradient <- function(beta,Y,X) {
  return ( as.vector(-2*t(X)%*%(Y-X%*%beta)) )
}

## initial values
beta0 <- runif(dim(X)[2]) #start at uniform random numbers equal to number of coefficients

## Algorithm parameters
options <- list("algorithm"="NLOPT_LD_LBFGS","xtol_rel"=1.0e-6,"maxeval"=1e3)

## Optimize!
betaOLSgrad <- nloptr( x0=beta0,eval_f=objfun,eval_grad_f=gradient,opts=options,Y=Y,X=X)

objfun  <- function(theta,Y,X) {
  # need to slice our parameter vector into beta and sigma components
  beta1    <- theta[1:(length(theta)-1)]
  sig     <- theta[length(theta)]
  # write objective function as *negative* log likelihood (since NLOPT minimizes)
  loglike <- -sum( -.5*(log(2*pi*(sig^2)) + ((Y-X%*%beta1)/sig)^2) ) 
  return (loglike)
}

## read in the data

## initial values
theta0 <- runif(dim(X)[2]+1) #start at uniform random numbers equal to number of coefficients

## Algorithm parameters
options <- list("algorithm"="NLOPT_LN_NELDERMEAD","xtol_rel"=1.0e-6,"maxeval"=1e4)

## Optimize!
betaMLE <- nloptr( x0=theta0,eval_f=objfun,opts=options,Y=Y,X=X)

betaOLSlm = lm(Y ~ X -1)
library(stargazer)
stargazer(betaOLSlm)