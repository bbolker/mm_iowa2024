library(lmerTest)
library(glmmTMB)
library(ggalt)
library(ggplot2); theme_set(theme_bw())
library(broom.mixed)
library(purrr)

dd <- readRDS("data/ecoreg.rds")
gg0 <- ggplot(dd, aes(NPP_log_sc, mbirds_log, colour = biome)) + geom_point()
print(gg0)
gg0 + geom_smooth(method = "lm")
gg0 + ggalt::geom_encircle()

m1 <- lmer(mbirds_log ~ NPP_log_sc*Feat_log_sc +
               (NPP_log_sc*Feat_log_sc|biome),  
           data = dd)
## singular

m2 <- lmer(mbirds_log ~ NPP_log_sc*Feat_log_sc +
               (NPP_log_sc+Feat_log_sc|biome),  
           data = dd)

performance::check_model(m2)
rr <- DHARMa::simulateResiduals(m2)
plot(rr)

## more on troubleshooting later

summary(m2)

dotwhisker::dwplot(m2, effects = "fixed", by_2sd = TRUE) +
    geom_vline(xintercept = 0, lty = 2)

dotwhisker::dwplot(list(sing = m1, nonsing = m2),
                   effects = "fixed", by_2sd = TRUE) +
    geom_vline(xintercept = 0, lty = 2)

coef(summary(m2))    

## profile confidence intervals get funky
p2 <- profile(m2, which = "theta_", verbose = 10,
              signames = FALSE)
lattice::xyplot(p2)

