#' @title Get Hour
#' @description A helper function used to pull the our information from a POSIX object.
#' @param x An object of class POSIX or a vector containing POSIX.
#' @export
hour = function (x) {
  if (any(!is.POSIXct(x))) {message('Object(s) passed to get.hour is not a POSIX.')}
  as.POSIXlt(x)$hour
}
