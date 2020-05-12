#' is Valid Email
#'
#' Help validate email entered by user
#'
#' @param email email entered by user
#'
#' @keywords internal
isValidEmail <- function(email) {
  grepl("\\<[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\>", as.character(email), ignore.case=TRUE)
}