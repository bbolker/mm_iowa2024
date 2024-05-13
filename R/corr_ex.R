library(glmmTMB)

data("Nile")
nile <- data.frame(date = 1871:1970, flow = c(Nile))

## shouldn't these models be equivalent?
fit1 <- gls(flow ~ date, correlation = corAR1(), data = nile)
nile$dummy <- factor(1)
fit2 <- glmmTMB(flow ~ date + ar1(factor(date) + 0 | dummy),
                data = nile,
                dispformula = ~ 0,
                start = list(theta = c(5, 0.4)),
                REML = TRUE)

with(fit2$obj$env, fit2$obj$fn(last.par.best[-random]))
pf <- function(x) x/sqrt(1-x^2)
p0 <- pf(coef(fit1$modelStruct$corStruct, unconstrained = FALSE))
fit2$obj$env$last.par.best
fit2$obj$fn(c(log(sigma(fit1)), p0))
-1*c(logLik(fit1))

fit2 <- glmmTMB(flow ~ 1 + s(date, bs = "gp"),
                data = nile,
                REML = TRUE)

##phi/sqrt(1-phi^2)
set.seed(101)
n <- 25                                              ## Number of time points
x <- MASS::mvrnorm(mu = rep(0,n),
             Sigma = .7 ^ as.matrix(dist(1:n)) )    ## Simulate the process using the MASS package
y <- x + rnorm(n)                                   ## Add measurement noise
times <- factor(1:n, levels=1:n)
group <- factor(rep(1,n))
dat0 <- data.frame(y, times, group)

fit3 <- glmmTMB(y ~ ar1(times + 0 | group), data=dat0, dispformula = ~0,
                REML = TRUE)
fit4 <- gls(y ~ 1, correlation = corAR1(form = ~1|group), data = dat0)
all.equal(c(logLik(fit3)), c(logLik(fit4)))
