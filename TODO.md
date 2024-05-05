## Iowa

* setup instructions
   * packages
   * `renv` snapshot?
   * recommend RStudio/Posit cloud? WebR?
* poll to registrants
* intro
   * new 'universe' picture?

### glitches/troubleshooting

makefile to link pix, glmm.bib
coefplot2 from palday/coefplot2
mvbutils?
(convert coefplot2 code to dotwhisker ...)

* starlings with glmmTMB + dispformula = ~0 + REML=TRUE; why do we get a non-pos-def Hessian?
* sjPlot: how to get multiple terms?
* why do location-scale plots differ between performance::check_model() and using lme4 builtins?
* coef plots comparing Wald and profile CIs for starlings, using `tidy()` + `by_2sd()` ...

### topics

* GLMM intro
   * add mmd_utils/fire picture?
   * add basic GLM stuff
   * mention BLUPs/conditional means
   * comparisons between SAS, Stata, AS-REML, Julia, Python, ...
* basic GLMMs
   * distributions: beta, Tweedie, t, ...
* simulate_new()
* troubleshooting: convergence warnings, singular fits, complete separation
    * convergence warnings: `allFit` (+ tidy etc)
	* singular fits? Matuschek et al, Barr et al
	    * fragility
* model building
   * X matrix; formula construction
   * Z matrix: Khatri-Rao products
   * covariance matrix (Sigma): blocks
   * parameterizing p-d covariance matrices
* model-hacking
   * modular code in `lme4` (`?modular`), `glmmTMB` (`?fitTMB`)
* advanced models
   * covariance structures
* internals:
   * constructing random effect structures
   * modular framework
   * covariance matrix parameterizations
   
* troubleshooting: diagnostics
* troubleshooting: speed and scale?
* inference: Wald (ddf issues), profiles, LRT, bootstrapping (P/NP)

https://www.regcytes.extension.iastate.edu/appliedstatistics/

* Review of concepts and definitions
* Troubleshooting convergence and singular-fit issues
* Random effects with structured covariance matrices and alternative bases (e.g. multivariate models, multimembership models, penalized spline bases)
 * Inference and prediction: likelihood profiling, non-parametric and parametric bootstrapping, bias correction for GLMMs, confidence intervals on predictions
* Frequentist (empirical Bayesian) and fully Bayesian methods

## old


- deal with singular fit warnings in boot/augment/influence
- temp repo for extras?
- use allFit from package rather than source?

* GLMM intro
    * pictures of X, Z for random-int, random-slopes models?
	* fix stier fig (tidy?)
* find/update/post Banta example? (ecostats chapter?)
	
* repo?  fix up
* clean up data? use rds/csv, read automatically and get obs/group numbers?
* allFit: return SEs of fixed effects? plot method???

* auto-scaling/centering of variables
* compare R^2 results across packages ...

* **look at merTools predict vignette!!**

* more on prediction issues
    * conditional vs marginal (integrate, simulate, delta method, closed-form)
    * exact conditional vs "partial conditional" (draw from cond sample) vs pop
	* variance in
	* importance sampling

* easier multi-group membership models?

 
