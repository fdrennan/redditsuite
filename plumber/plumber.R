library(redditsuite)
library(plumber)


#* @filter cors
cors <- function(req, res) {
  message(glue("Within filter {Sys.time()}"))
  res$setHeader("Access-Control-Allow-Origin", "*")
  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods", "*")
    res$setHeader(
      "Access-Control-Allow-Headers",
      req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS
    )
    res$status <- 200
    return(list())
  } else {
    plumber::forward()
  }
}


#* @serializer unboxedJSON
#* @param subreddit  Subreddit name to pull data from
#* @param limit  Maximum number of submissions to return
#* @get /submissions
function(subreddit = "all",
         limit = 5) {
  limit <- as.numeric(limit)

  response <- list(
    status_code = 200,
    data = "",
    message = "Success!",
    meta_data = list(
      args = list(
        subreddit = subreddit,
        limit = limit
      ),
      runtime = 0
    )
  )

  if (limit > 100) {
    response$message <- "Limit must be less than 100"
    return(response)
  }

  response <- tryCatch(
    expr = {
      tic()
      submissions <- submission_pull(
        connection_reddit(),
        subreddit = "all",
        limit = limit,
        to_json = TRUE,
        pretty = FALSE
      )
      timer <- toc(quiet = TRUE)
      response$meta_data$runtime <- as.numeric(timer$toc - timer$tic)
      submissions
    },
    error = function(err) {
      response$status_code <- 400
      response$message <- paste(err)
      return(response)
    }
  )

  return(response)
}
