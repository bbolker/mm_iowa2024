library(lme4)
dd <- expand.grid(ttt = factor(1:3), cluster = factor(1:10),
                   rep = 1:5)
## 3x3 cov matrix: diagonal v_1, v_2, v_3 + c_12, ...
## theta = 3*(3+1)/2 = 6 parameters
form <- ~ 1 + (0 + ttt | cluster)
s1 <- simulate(form, newdata = dd, family = gaussian,
          newparams = list(beta = 1,
               theta = rep(1,6),
               sigma = 1),
            seed = 101,
            nsim = 1000)
library(glmmTMB)
simulate_new(form, newdata = dd, family = gaussian,
             newparams = list(beta = 1,
                              ## different parameterization!
                              ## log-SD vector
                              theta = rep(1,6),
                              betad = 1),
             seed = 101,
             nsim = 1000)

s1[[1]]
m <- matrix(c(3,1,1,1,3,1,1,1,3), nrow = 3)
cc <- chol(m/1) ## divide by residual variance & Cholesky decompose
cct <- t(cc)
th <- cct[lower.tri(cct, diag = TRUE)]



form, newdata = dd, family = gaussian,
          newparams = list(beta = 1,
               theta = rep(1,6),
               sigma = 1),
            seed = 101,
            nsim = 1000)


set.seed(102)
dd <- data.frame(x = rpois(1000, lambda = 2))
m1 <- MASS::glm.nb(x ~ 1, data = dd)

library(lme4)
source("R/conv_ex.R")
model1 <- lmer(eval~1 + group*(emint_n + grade_n) + 
                 (1 + grade_n+emint_n|class), data=dd)
source("R/allFit_utils.R")
library(broom.mixed)
tidy(aa)

model2 <- lmer(eval~1 + group*(emint_n + grade_n) + 
                 (1 + grade_n+emint_n || class), data=dd)
## (1 | class) + (0 + grade_n | class) + (0 + emint_n | class)

library(glmmTMB)

model2 <- glmmTMB(eval~1 + group*(emint_n + grade_n) + 
                 diag(1 + grade_n+emint_n | class), data=dd)

model3 <- glmmTMB(eval~1 + group*(emint_n + grade_n) + 
                    cs(1 + grade_n+emint_n | class), data=dd)

 (f || g) -> (1 | g) + (0 + f | g)
  (1 | g) + (0 + dummy(f, "a") | g) + (0 + dummy(f, "b"))
diag()
 
bbmle::AICtab(model1, model2, model3)

library(lme4)
lf <- lFormula(Reaction ~ Days + (Days|Subject), sleepstudy)
df <- do.call(mkLmerDevfun, lf)
df(c(1,0,1))
df2 <- function(theta) {
  df(c(theta[1], 0, theta[2]))
}
n1 <- nloptwrap(c(1,1), fn = df2, lower = c(0,0), upper = c(Inf, Inf))
df3 <- function(theta) {
  ## homogeneous compound symmetric matrix
  ## theta[1] = correlation
  ## theta[2] = std dev
  corrmat <- matrix(theta[1], 2, 2)
  diag(corrmat) <- 1
  covmat <- theta[2]^2*corrmat
  cc <- t(chol(covmat))
  devfun(cc[lower.tri(cc)])
}

lf2 <- lFormula(Reaction ~ Days + (1|Subject), sleepstudy)
dim(lf2$reTrms$Zt)


library(glmmTMB)
m1 <- glmmTMB(count ~ mined + (1|site),
              family = poisson, data = Salamanders, doFit = FALSE)
m2 <- fitTMB(m1, doOptim = FALSE)
m3 <- with(m2, nlminb(par, objective = fn, gr = gr))
m4 <- finalizeTMB(m1, m2, m3)
