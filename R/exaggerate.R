#' @title Exaggerate (Transform) Data for plotting
#' @author Thomas Bryce Kelly
#' @param x data values to be transformed (e.g. depth)
#' @param power a positive value, typically less than 1, which is the exponent of the transformation (default = 0.8)
#' @export
exaggerate = function(x, power = 0.8) {
  sign(x) * abs(x)^power
}


#' @title Exaggerate (Transform) Data for plotting
#' @author Thomas Bryce Kelly
#' @param x data values to be transformed (e.g. depth)
#' @param power a positive value, typically less than 1, which is the exponent of the transformation (default = 0.8)
#' @param ... optional values that are passed onto axis()
#' @export
axisExaggerated = function(side, power = 0.8, at = NULL, labels = NULL, grid = F, lty = 2, col = 'grey', ...) {
  if (is.null(at)) {
    if (side == 1 | side == 3) {
      at = pretty(pmax(0, par('usr')[1:2])^(1/power))
    } else {
      at = pretty(pmax(0, par('usr')[3:4])^(1/power))
    }
  }

  if (is.null(labels)) { labels = at }

  ## Transform
  at = at ^ power

  if (grid & (side == 1 | side == 3)) {
    abline(v = at, lty = lty, col = col)
  }
  if (grid & (side == 2 | side == 4)) {
    abline(h = at, lty = lty, col = col)
  }

  axis(side = side, at = at, labels = labels, ...)
}

