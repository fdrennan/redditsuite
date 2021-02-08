library(redditsuite)
n_second <- 60
init_time <- Sys.time()
print(init_time)
submissions_main <- function() {
  while ((t_diff <- as.numeric(Sys.time() - init_time)) < n_second) {
    print(t_diff)
    time_1 <- tic()
    results <- catch_expr(
      submissions_gather(subreddit = "all", limit = 1000),
      warning = c(collect, muffle)
    )
    if (!inherits(results, "data.frame")) {
      print(results)
      Sys.sleep(600)
    }
    time_2 <- toc(quiet = TRUE)
    diff_time <- time_2$toc - time_2$tic
    message(glue("This took {round(diff_time, 2)} seconds to run."))
  }
}
submissions_main()
