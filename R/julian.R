#' @title Get Julian Day
#' @description A helper function used to pull the our information from a POSIX object.
#' @param x An object of class POSIX or a vector containing POSIX.
#' @export
julian = function (x) {
  if (any(!is.POSIXct(x))) {message('Object(s) passed to get.day is not a POSIX.')}
  as.numeric(difftime(x, make.time(year = get.year(x)), units = 'days')) - 1
}
