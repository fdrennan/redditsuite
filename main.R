library(redditsuite)

while (TRUE) {
  time_1 <- tic()
  results <- catch_expr(
    submissions_gather(subreddit = "all", limit = 1000),
    warning = c(collect, muffle)
  )
  if (!inherits(results, "data.frame")) {
    Sys.sleep(600)
    print(results)
  }
  time_2 <- toc(quiet = TRUE)
  diff_time <- time_2$toc - time_2$tic
  message(glue("This took {round(diff_time, 2)} seconds to run."))
}
