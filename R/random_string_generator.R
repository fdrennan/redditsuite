

#' random_string_generator
#'
#'
#' @description Used to create passwords
#' @return vector
#'
#' @export random_string_generator
random_string_generator <- function(length_password = 40) {
  password <- sample(c(letters, LETTERS, 0:9), length_password, replace = TRUE)
  password <- paste0(password, collapse = "")

  username <- to_snake_case(
    paste0(randomNames(), randomNames())
  )

  email <- str_remove_all(username, '_')

  list(
    email = email,
    username = username,
    password = password
  )
}


