library(lme4)
library(brms)
library(rstanarm)
library(MCMCglmm)
library(glmmTMB)
t1 <- replicate(10, system.time(
    lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
)[[3]])
t1B <- replicate(10, system.time(
    glmmTMB(Reaction ~ Days + (Days | Subject), sleepstudy)
)[[3]])
## 0.03 seconds
t2 <- system.time(
    stan_lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
)
## 34 seconds
t3 <- system.time(
    brm(Reaction ~ Days + (Days | Subject), sleepstudy)
)
## https://discourse.mc-stan.org/t/separating-compilation-sampling-with-brms-on-cluster/8905/2
t4 <- system.time(
    fit_empty <- brm(Reaction ~ Days + (Days | Subject), sleepstudy, chains = 0)
)
t5 <- system.time(
    fit <- update(fit_empty, recompile = FALSE, chains = 4)
    )
t6 <- system.time(
    fit <- MCMCglmm(Reaction ~ Days, random = ~us(1+Days):Subject,
                    data = sleepstudy,
                    prior = list(G = list(list(V=diag(2), nu = 0.1))))
)

res <- data.frame(
    pkg = rep(c("lmer", "glmmTMB",
          "rstanarm", "brms_total", "brms_compile",
          "brms_sample", "MCMCglmm"),
          c(10,10,1,1,1,1,1)),
    time = c(t1, t1B, t2[[3]], 
      t3[[3]], t4[[3]], t5[[3]], t6[[3]]))
saveRDS(res, file = "timecomp.rds")
