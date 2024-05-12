if (!require(tidyverse) || !require(colorspace)) stop("need tidyverse and colorspace")

glance_allfit_NLL <- function(aa) {
    glance(aa) |> dplyr::select(optimizer, NLL_rel) |> dplyr::arrange(NLL_rel)
}

#' @param aa an object of class `allFit`
#' @param keep_effects which effects to keep?
#' @param dodgewidth how far apart to space point+range elements
#' @param sep_corsd whether to separate correlation and SD terms into separate facets
plot_allfit <- function(aa, keep_effects = "fixed", dodgewidth = 0.5,
                        sep_corsd = "ran_pars" %in% keep_effects) {
    gg <- glance_allfit_NLL(aa)
    tt <- tidy(aa) |> mutate(across(optimizer, \(x) factor(x, levels = rev(gg$optimizer),
                                                           labels = rev(sprintf("%s (%1.2g)", gg$optimizer, gg$NLL_rel)))))
    if (!is.null(keep_effects)) tt <- tt |> dplyr::filter(effect %in% keep_effects)
    pd <- position_dodge(width = dodgewidth)
    gg1 <- ggplot(tt, aes(y = term, x = estimate, colour = optimizer)) +
        geom_pointrange(aes(xmin=estimate-2*std.error, xmax = estimate + 2*std.error),
                    position = pd) +
        scale_color_discrete_sequential(guide = guide_legend(reverse = TRUE),
                                        name = "optimizer (ΔNLL)")
    if (sep_corsd) {
        gg1 <- gg1 + facet_wrap(~startsWith(term, "cor"), labeller=label_both, scale = "free")
    }
    return(gg1)
}

