## miscellaneous Monday code

load("data/gopherdat2.RData")
library(ggplot2)
theme_set(theme_bw())
(ggplot(Gdat, aes(year, shells/Area, colour=Site))
  + geom_point() + geom_line() +
    theme(legend.position="none")
)

data("cbpp", package="lme4")
cbpp2 <- transform(cbpp,
            period=as.numeric(as.character(period)))
g0 <- ggplot(cbpp2,aes(period,incidence/size))

g1 <- g0 + geom_line(aes(colour=herd)) +
    geom_point(aes(colour=herd)) +
  facet_wrap(~herd)

cbpp3 <- transform(cbpp2,herd=reorder(herd,incidence/size))

g1 %+% cbpp3
           
(g0
  + geom_point(aes(size=size,group=herd))
  + geom_smooth(aes(group=herd,weight=size),
                method="glm",
                method.args=list(family=binomial),
                se=FALSE))

library(ggalt)
source("R/geom_cstar.R")
ggplot(Gdat,aes(prev,shells/Area,colour=Site)) + geom_point() +
  ## geom_encircle(aes(group=Site)) + 
  stat_centseg(cfun=mean) 
  ## geom_path()
  

load("data/Banta.RData")
## dat.tf$ltf1 <- log(dat.tf$total.fruits+1)
g6 <- ggplot(dat.tf,aes(nutrient,total.fruits,colour=gen))+
  geom_point()+
  scale_y_continuous(trans="log1p")+
  ## geom_line(aes(group=gen))+
  facet_wrap(~amd)+
  stat_summary(fun.y=mean,aes(group=interaction(popu,gen)),
               geom="line")

library(plotly)
ggplotly(g6)
g6

  stat_summary(fun.y=mean,aes(group=interaction(popu,gen)),
               geom="line")
source("R/geom_cstar.R")
  
ticks <- read.table("data/Elston2001_tickdata.txt",
                    header=TRUE)
ticks <- transform(ticks,YEAR=factor(YEAR),
                   scHEIGHT=(HEIGHT-min(HEIGHT))/100)

library(ggalt)
library(ggplot2)
ggplot(ticks,aes(x=scHEIGHT,y=TICKS,colour=YEAR))+
  geom_point() + scale_y_log10() +
  geom_smooth(method="glm",
         method.args=list(family=poisson))

g1 <- glm(TICKS~scHEIGHT*YEAR,family=poisson,
          data=ticks)
g2 <- update(g1,family=quasipoisson)
g3 <- MASS::glm.nb(TICKS~scHEIGHT*YEAR,
          data=ticks)
library(lme4)
## ticks$obs <- seq(1:nrow(ticks))
g4 <- glmer(TICKS~scHEIGHT*YEAR+(1|INDEX),
            data=ticks,family=poisson)
