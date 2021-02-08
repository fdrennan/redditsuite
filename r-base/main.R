library(redditsuite)
n_second <- 60*60
init_time <- Sys.time()
print(init_time)
submissions_main <- function() {
  while ((t_diff <- as.numeric(Sys.time() - init_time)) < n_second) {
    print(t_diff)
    time_1 <- tic()
    con <- connection_reddit()
    results <- submissions_gather(con, subreddit = "all", limit = 200)
    time_2 <- toc(quiet = TRUE)
    diff_time <- time_2$toc - time_2$tic
    slack_notify(glue("This took {round(diff_time, 2)} seconds to run."))
  }
}
tryCatch(submissions_main(), error = function(err) {
  slack_notify(err)
})

