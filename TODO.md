## Iowa

* setup instructions
   * packages
   * `renv` snapshot?
   * recommend RStudio/Posit cloud? WebR?
* poll to registrants
* schedule details
   * 9-9:45 overview, LMMs
   * 9:45-10:15 **break**
   * 10:15-10:45 LMMs, lab
   * 10:45-11:15 **coffee?**
   * 11:15-noon GLMMs
   * noon - 1 **lunch**
   * 1-1:45 GLMM lab
   * 1:45 - 2 **break**
   * 2-2:45 
   * 2:45-3:15 coffee
   * 3:15-4
   * 4-4:15
   * 4:15-5 open session/Q&A?
   
### topics

* basic LMMs
* basic GLMMs
* simulate_new()
* troubleshooting: convergence warnings, singular fits, complete separation
    * convergence warnings: `allFit` (+ tidy etc)
	* singular fits? Matuschek et al, Barr et al
	    * fragility
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

 
