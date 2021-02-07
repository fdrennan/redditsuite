#' submission_pull
#' @export submission_pull
submission_pull <- function(con, subreddit = NULL, limit = 10,
                            columns_selected = c(
                              "archived", "author", "author_premium", "domain", "fullname", "hidden",
                              "id", "is_original_content", "is_self", "name",
                              "num_crossposts", "over_18", "permalink", "selftext",
                              "subreddit", "subreddit_id", "subreddit_subscribers",
                              "thumbnail", "title", "ups", "upvote_ratio", "url", "visited"
                            ),
                            wide = TRUE,
                            to_json = FALSE) {
  if (!is.null(subreddit)) {
    submission_response <- iterate(con$subreddit(subreddit)$new(limit = limit))
  } else {
    submission_response <- iterate(con$front$new(limit = limit))
  }

  items_in_submission <- names(submission_response[[1]])

  message("Items in object")
  print(items_in_submission)

  reddit_data <- map_dfr(
    submission_response,
    function(submission) {
      map_dfr(
        columns_selected,
        function(submission_title) {
          table_obj <- tibble(
            name = submission_title,
            object = {
              tryCatch(expr = {
                unlist(as.character(submission[submission_title]))
              }, error = function(err) {
                as.character("Error")
              })
            }
          )
          table_obj$unique_id <-
            paste(
              submission$id,
              submission$author,
              submission$subreddit,
              submission$created_utc,
              sep = "-"
            )
          table_obj
        }
      )
    }
  )

  if (wide) {
    reddit_data <-
      reddit_data %>%
      pivot_wider(names_from = name, values_from = object)
  }

  if(to_json) {
    reddit_data <- toJSON(reddit_data, pretty = TRUE)
  }

  reddit_data
}
