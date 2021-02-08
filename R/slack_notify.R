#' slack_notify
#' @export slack_notify
slack_notify <- function(notification, SLACK_API_KEY = Sys.getenv('SLACK_API_KEY')) {
  url_location <- glue('https://hooks.slack.com/services/{SLACK_API_KEY}')
  message(notification)
  POST(
    url_location,
    body = list(text = notification),
    encode = "json"
  )
}
