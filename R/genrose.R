genrose.f <- function(x, gs = NULL) {
     # objective function
     ## One generalization of the Rosenbrock banana valley
     #   function (n parameters)
     n <- length(x)
     if (is.null(gs)) {
         gs = 100
     }
     fval <- 1 + sum(gs * (x[1:(n - 1)]^2 - x[2:n])^2 + (x[2:n] - 
         1)^2)
     return(fval)
 }

genrose.g0 <- function(x, gs = NULL) {
     # gradient for genrosef, genrose.f / genrosep.f
     n <- length(x)
     if (is.null(gs)) {
         gs = 100
     }
     gg <- as.vector(rep(0, n))
     for (i in 2:n) {
         z1 <- x[i] - x[i - 1] * x[i - 1]
         z2 <- 1 - x[i]
         gg[i] <- 2 * (gs * z1 - z2)
         gg[i - 1] <- gg[i - 1] - 4 * gs * x[i - 1] * z1
     }
     return(gg)
 }

genrose.h <- function(x, gs = NULL) {
     ## compute Hessian
     if (is.null(gs)) {
         gs = 100
     }
     n <- length(x)
     hh <- matrix(rep(0, n * n), n, n)
     for (i in 2:n) {
         z1 <- x[i] - x[i - 1] * x[i - 1]
         z2 <- 1 - x[i]
         hh[i, i] <- hh[i, i] + 2 * (gs + 1)
         hh[i - 1, i - 1] <- hh[i - 1, i - 1] - 4 * gs * z1 - 
             4 * gs * x[i - 1] * (-2 * x[i - 1])
         hh[i, i - 1] <- hh[i, i - 1] - 4 * gs * x[i - 1]
         hh[i - 1, i] <- hh[i - 1, i] - 4 * gs * x[i - 1]
     }
     return(hh)
}
