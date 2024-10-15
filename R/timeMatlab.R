
#' @title Convert Time Matlab
#' @param x The numeric timestamp that will be converted.
#' @export
timeMatlab = function (x = Sys.time(), tz = "UTC") {
  as.POSIXct((x - 1)*86400, origin = "0000-01-01", tz = tz)
}
