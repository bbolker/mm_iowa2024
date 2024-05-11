tidy.parameters_model <- function(x, ...) {
    require("parameters")
    ret <- (x
        |> c()
        |> dplyr::as_tibble()
        |> standardize_names(style = "broom")
    )
    return(ret)
}
