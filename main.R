library(redditsuite)
n_second <- 60*60
init_time <- Sys.time()

SUBREDDIT = Sys.getenv('SUBREDDIT')
NROWS = Sys.getenv('NROWS')
walk(seq(2, 10, 3), ~ alertr(paste0(rep("=", .), collapse="")))
walk(seq(2, 10, 3), ~ alertr(paste0(rep("=", .), collapse="")))
alertr('Starting submission data gathering with parameters---')
alertr('SUBREDDIT = {SUBREDDIT}')
alertr('NROWS = {NROWS}')
alertr('Pulling limit `{NROWS}` from `{SUBREDDIT}`')

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
    slack_notify(
      glue("`{n_rows_collected}` rows took `{round(diff_time, 2)}` seconds to run.")
    )
  }
}

tryCatch(submissions_main(), error = function(err) {
  slack_notify("--------ERROR-ERROR-ERROR-ERROR-----------")
  slack_notify(glue("Error time {now(tzone = 'UTC')}"))
  slack_notify(as.character(paste0("`", err, "`")))
  slack_notify("-----------------------------------")
})

