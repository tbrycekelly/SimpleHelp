#' @title Get Minutes
#' @export
minute = function (x) {
  if (any(!is.POSIXct(x))) {message('Object(s) passed to get.minutes is not a POSIX.')}
  as.POSIXlt(x)$min
}
