## from https://github.com/lme4/lme4/issues/783
set.seed(4)

dd <- data.frame(
    class = sample(1:25, 150, replace = TRUE),
    grade = pmin(7 + floor(runif(150,2,14) + rnorm(150)), 20),
    emint  = rnorm(150, 100, 15),
    group = rep(c("training", "control", "school"), each=50),
    rater = sample(1:10, 150, replace = TRUE),
    rater_bias = rnorm(10, 0, 2)
)

training_effect <- list(training=2.5,school=2,control=0)
class_bias <- rnorm(25, 0, 1)

emint_effect <- 0.001
emint_sd <- 0
emint_bs <- rnorm(25, emint_effect, emint_sd)

grade_effect <- 0.3
grade_sd <- 0.2
grade_bs <- rnorm(25, grade_effect, grade_sd)

t_eff <- as.numeric(training_effect[dd$group])
emint_b <- emint_bs[dd$class]
grade_b <- grade_bs[dd$class]
rater_b <- dd$rater_bias[dd$rater]
class_b <- class_bias[dd$class]

dd$eval <- pmax(pmin(floor(4 + t_eff + class_b + rater_b + emint_b*dd$emint + (grade_b*(dd$grade-mean(dd$grade)))  + 2*rnorm(150)), 10), 0)

dd$emint_n <- dd$emint - mean(dd$emint)
dd$grade_n <- dd$grade - mean(dd$grade)
## model <-lmer(eval~group*emint_n + group*grade_n + (grade_n+emint_n|class), data=data)

## with simulate:


