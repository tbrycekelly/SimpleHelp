#' @title Calculate Simple Moving Average
#' @author Laura Whitmore
#' @param parameter signal or vector to be smoothed
#' @param k the integer number of entries to average over
#' @export
sma = function(parameter, k, f = mean) {
  if (k %% 2 == 1) {
    k = k - 1
  } else {
    stop('Please select an odd window size.')
  }
  k = k / 2
  sma = rep(NA, length(parameter)) ## need this vector to be the same length as parameter
  for (i in 1:length(parameter)) {
    if (i <= k | i >= length(parameter) - k + 1) {
      sma[i] = NA
    } else {
      series = c((i - k):(i + k))
      sma[i] = f(parameter[series])
    }
  }
  sma
}
