library(redditsuite)
n_second <- 60*60
init_time <- Sys.time()

alertr <- function(msg, use_glue = TRUE, types = c('alert')) {
  if (use_glue) {
    msg <- glue(msg)
  }
  walk(
    types,
    function(x) {
      switch(
        x,
        'slack' = {
          slack_notify(msg)
        },
        'alert' = {
          cli_alert(msg)
        }
      )
    }
  )
}

SUBREDDIT = Sys.getenv('SUBREDDIT')
NROWS = Sys.getenv('NROWS')
walk(seq(2, 10, 3), ~ alertr(paste0(rep("=", .), collapse="")))
walk(seq(2, 10, 3), ~ alertr(paste0(rep("=", .), collapse="")))
alertr('Starting submission data gathering with parameters---')
alertr('SUBREDDIT = {SUBREDDIT}')
alertr('NROWS = {NROWS}')
alertr('Pulling limit `{NROWS}` from `{SUBREDDIT}`')

on.exit(alertr('Stopping submissions....'))
submissions_main <- function() {
  while ((t_diff <- as.numeric(Sys.time() - init_time)) < n_second) {
    diff_message <- capture.output(t_diff)
    alertr(glue('Submissions runtime -- {diff_message}'))
    time_1 <- tic()
    con <- connection_reddit()
    # browser()
    results <- submissions_gather(
      con,
      subreddit = SUBREDDIT,
      limit = as.integer(NROWS)
    )
    time_2 <- toc(quiet = TRUE)
    diff_time <- time_2$toc - time_2$tic

    n_rows_collected <- nrow(results)
    alertr(
      glue("`{n_rows_collected}` rows took `{round(diff_time, 2)}` seconds to run.")
    )
  }
}

tryCatch(submissions_main(), error = function(err) {
  alertr("--------ERROR-ERROR-ERROR-ERROR-----------")
  alertr(glue("Error time {now(tzone = 'UTC')}"))
  alertr(as.character(paste0("`", err, "`")))
  alertr("-----------------------------------")
})

