#' alertr
#' @export alertr
alertr <- function(msg, use_glue = TRUE, types = c("alert")) {
  if (use_glue) {
    msg <- glue(msg)
  }
  walk(
    types,
    function(x) {
      switch(
        x,
        "slack" = {
          slack_notify(msg)
        },
        "alert" = {
          cli_alert(msg)
        }
      )
    }
  )
}
