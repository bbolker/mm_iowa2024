library(lme4)
library(buildmer)
save_fn <- "data/arabidopsis_batch.rda"

L <- load("data/Banta.RData")
dat.tf <- transform(dat.tf,
                    reg_popu = interaction(reg, popu),
                    reg_popu_gen = interaction(reg, popu, gen),
                    obs = factor(seq(nrow(dat.tf)))
                    )
                    
buildmer_fit <-buildmer(total.fruits ~ nutrient*amd +
             rack + status +
             (1 + amd*nutrient|reg) +
             (1 + amd*nutrient|reg_popu) +
             (1 + amd*nutrient|reg_popu_gen) +
             (1 | obs),
         family = poisson,
         data = dat.tf)

mp_obs <- glmer(total.fruits ~ nutrient*amd +
                rack + status + reg + 
                (1|obs),
                data=dat.tf, family="poisson")

mp_fits <- list(obs=mp_obs)
## skip 'both'
mods <- c("int","nutrient","amd","none")

mf <- function(x,level) {
  if (x=="nutrient") x <- "nut"
  paste(x,level,sep="_")
}

modf <- function(w,level) {
  if (w=="none") { "" } else {
    if (w=="int") w <- 1
    if (w=="both") {
      paste("+(amd+nutrient|",level,")",sep="")
    } else {
      paste("+(",w,"|",level,")",sep="")
    }
  }
}

modf("both","gen")
modf("both","gen")
modf("amd","gen")
modf("amd","gen")
mf("amd","gen")

for (i in seq_along(mods)) {
    for (j in seq_along(mods)) {
        cat(mods[i],mods[j],"\n")
        ## skip no-RE (already done as mp_obs)
    if (!(mods[i]=="none" && mods[j]=="none")) {
      cn <- paste(mf(mods[i],"gen"),mf(mods[j],"popu"),sep="_")
      cat("**",cn,"\n")
      genmod <- modf(mods[i],"gen")
      popumod <- modf(mods[j],"popu")
      rform <- as.formula(paste(".~.",genmod,popumod,sep=""))
      curfit <- update(mp_obs,rform)
      mp_fits <- c(list(curfit),mp_fits)
      names(mp_fits)[1] <- cn
    }
  }
}

save("buildmer_fit", "mp_fits",file = save_fn)
