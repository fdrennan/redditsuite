#' submissions gather
#' @export submissions_gather
submissions_gather <- function(con, subreddit = "all", limit = 100) {
  submissions <- submission_pull(
    con,
    subreddit = subreddit,
    limit = limit
  )

  submissions <- transmute(
    submissions,
    unique_id,
    fullname,
    id,
    name,
    subreddit_id,
    author,
    title,
    selftext,
    subreddit,
    permalink,
    domain,
    url,
    thumbnail,
    num_crossposts = as.integer(num_crossposts),
    subreddit_subscribers = as.integer(subreddit_subscribers),
    ups = as.integer(ups),
    upvote_ratio = as.numeric(upvote_ratio),
    archived = as.logical(archived),
    author_premium = as.logical(author_premium),
    hidden = as.logical(hidden),
    is_original_content = as.logical(is_original_content),
    is_self = as.logical(is_self),
    over_18 = as.logical(over_18),
    visited = as.logical(visited),
    time_collected_utc = now(tzone = "UTC")
  )

  con_pf <- connection_postgres()
  on.exit(dbDisconnect(con_pf))

  if (!dbExistsTable(con_pf, "submissions")) {
    dbExecute(con_pf, sql(read_file("sql/submissions.sql")))
  }

  dbxUpsert(
    con_pf,
    "submissions",
    submissions,
    where_cols = c("unique_id"),
    batch_size = 100,
    skip_existing = TRUE
  )
  submissions
}
