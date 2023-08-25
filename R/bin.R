#' @export
bin = function(x, y, xout, func = function(x){mean(x, na.rm = T)}) {
  cuts = cut.default(as.numeric(x), c(-Inf, as.numeric(xout)))
  vals = levels(cuts)
  x.vals = as.numeric(cuts)

  approx(x.vals, y, xout = c(1:length(vals)), ties = func)$y
}
