#' @title Get Seconds
#' @keywords Convert Time
#' @export
second = function (x = Sys.time()) {
  #if (any(!is.POSIXct(x))) {message('Object(s) passed to get.seconds is not a POSIX.')}
  as.numeric(format(Sys.time(), format = '%S'))
}


