#' @export
bin = function(x, y, xout, func = function(x){mean(x, na.rm = T)}) {
  # TODO NB: Assumes contiguous and equally spaced bins! No check for this. Not generalized.
  y = y[order(x)]
  x = x[order(x)]

  # Cooerce to numeric.
  x = as.numeric(x)
  y = as.numeric(y)
  xout = as.numeric(xout)

  startTime = as.numeric(Sys.time())

  yout = rep(NA, length(xout))

  xtmp = (length(xout) - 1) * (x - min(xout)) / (max(xout) - min(xout)) + 1
  xtmp = as.integer(round(xtmp)) ## This corresponds to the bin that each observations falls into.
  k = unique(xtmp)
  k = k[k > 0]
  k = k[k <= length(xout)]

  for (i in k) {
    yout[i] =  func(y[xtmp == i])
  }

  endTime = as.numeric(Sys.time())
  message('Interpolated ', format(length(x), big.mark = ','),
          ' values across ', format(length(xout), big.mark = ','),
          ' bins. Calculation took ', round(endTime - startTime, digits = 1),
          ' second(s).')

  yout[order(xout)] # Return interpoalted values.
}
