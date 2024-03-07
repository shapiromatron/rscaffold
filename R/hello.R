#' Basic addition method
#'
#' A sample method which can be used to demonstrate a real package.
#'
#' @param a First parameter
#' @param b Second parameter
#' @return the result
#' @export
addition <- function(a, b) {
  return(a + b)
}

#' Basic subtraction method
#'
#' A sample method which can be used to demonstrate a real package.
#'
#' @param a First parameter
#' @param b Second parameter
#' @return the result
#' @export
subtraction <- function(a, b) {
  return(a - b)
}

#' Square, using a method in C
#'
#' A sample method which calls a function in C
#'
#' @param x The parameter to square
#' @return the result
#' @useDynLib rscaffold
#' @export
square <- function(x) {
  result <- .C("square", as.double(x), "rscaffold.so")
  return(result[[1]])
}
