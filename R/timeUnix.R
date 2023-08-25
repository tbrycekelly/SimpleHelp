#' @title Convert Time Unix
#' @description A function used to convert a unix timestamp into a POSIXct object.
#' @export
timeUnix = function(x, tz = 'UTC') {
  as.POSIXct(x, origin = "1970-01-01", tz = tz)
}
