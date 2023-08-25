#' @title Convert Time Excel
#' @description Helper function for converting the datetime stamps from Microsoft Excel.
#' @author Thomas Bryce Kelly
#' @export
timeExcel = function (x, tz = "UTC") {
  as.POSIXct(x*86400, origin = "1899-12-30 00:00:00", tz = tz)
}
