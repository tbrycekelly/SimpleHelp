#' @title Trapezoidal Integration
#' @author Thomas Bryce Kelly
#' @export
trapezoidIntegration = function(x, y, xlim = NULL) {

  ## Perform checks
  if (length(x) != length(y)) { stop('Length of x and y are not equal!') }
  if (xlim[2] <= xlim[1]) { stop('xlim should be in ascending value!') }

  ## Ensure points are ordered:
  y = y[order(x, na.last = NA)]
  x = x[order(x, na.last = NA)]
  x = x[!is.na(y)]
  y = y[!is.na(y)]

  if (length(x) < 2) { stop('Integration requires 2 or more values!') }

  ## Interpolate if xlim is supplied
  if (!is.null(xlim)) {
    if (length(xlim) != 2) { stop('xlim requires two and only two values!') }

    if (xlim[1] > x[1]) {
      l = max(which(x < xlim[1]))
      y.new = approx(x[c(l, l+1)], y[c(l, l+1)], xout = xlim[1])$y
      x = x[-l]
      y = y[-l]
      x = c(xlim[1], x)
      y = c(y.new, y)
    }

    if (xlim[2] < x[length(x)]) {
      l = min(which(x > xlim[2]))
      y.new = approx(x[c(l-1, l)], y[c(l-1, l)], xout = xlim[2])$y
      x = x[-l]
      y = y[-l]
      x = c(x, xlim[2])
      y = c(y, y.new)
    }
  }

  ## Calculate integration
  dx = diff(x)
  yy = 0.5 * (y[-1] + y[-length(y)])

  sum(dx * yy)
}
