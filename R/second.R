#' @title Get Seconds
#' @keywords Convert Time
#' @export
second = function (x) {
  if (any(!is.POSIXct(x))) {message('Object(s) passed to get.seconds is not a POSIX.')}
  as.POSIXlt(x)$sec
}
