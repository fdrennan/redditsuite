#' pull_data
#' @export pull_data
pull_data <- function(n_obs = 100) {
  con <- connection_postgres()
  on.exit(dbDisconnect(con))
  submissions <- tbl(con, in_schema('public', 'submissions')) %>%
    arrange(desc(time_collected_utc)) %>%
    filter(!over_18) %>%
    head(local(n_obs))
  collect(submissions)
}
