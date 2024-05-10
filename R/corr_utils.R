simCor1 <- function(phi=0.8,sdgrp=2,sdres=1,
                    npergrp=20,ngrp=20,
                    seed=NULL) {
    if (!is.null(seed)) set.seed(seed)
    cmat <- sdres*phi^abs(outer(0:(npergrp-1),0:(npergrp-1),"-"))
    errs <- MASS::mvrnorm(ngrp,mu=rep(0,npergrp),Sigma=cmat)
    ranef <- rnorm(ngrp,mean=0,sd=sdgrp)
    d <- data.frame(f=rep(1:ngrp,each=npergrp))
    d$y <- ranef[as.numeric(d$f)] + c(t(errs)) ## unpack errors by row
    d$tt <- factor(rep(1:npergrp,ngrp))
    return(d)
}
