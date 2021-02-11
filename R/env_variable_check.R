#' env_variable_check
#' @description env_variable check verifies that a variable
#' coming from the .Renviron file actually exists.
#' @export env_variable_check
env_variable_check <- function(env_variable) {
  env_name <- deparse1(substitute(env_variable))
  message(glue("Checking {env_name}"))
  if (is.null(env_variable)) {
    env_variable <- Sys.getenv(env_name)
    if(env_variable == '') {
      stop(glue("{env_name} is missing a vlue"))
    }
  }
  env_variable
}
