#' @title Pad a Number with Leading Zeros
#' @author Thomas Bryce Kelly
#' @export
pad = function(x, pad = 4) {
  out = rep(NA, length(x))

  for (i in 1:length(x)) {
    dn = max(pad - nchar(x[i]), 0)
    out[i] = paste0(paste0(rep(0, dn), collapse = ''), x[i])
  }

  ## Return
  out
}
