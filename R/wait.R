#' @title System Wait
#' @description Function to have script wait a predefined time with progress bar option.
#' @author Thomas Bryce Kelly
#' @export
wait = function (sec, progress.bar = T) {
  if (class(sec) != "numeric") { stop('Seconds must be provided as a number!')}
  if (sec < 0) { stop('Delay length must be positive!')}

  if (progress.bar) {
    ## Setup
    end = as.numeric(Sys.time()) + sec
    pb = txtProgressBar(as.numeric(Sys.time()), end, style = 3)
    dt = sec / 101
    getTxtProgressBar(pb) # Show progress bar

    ## Loop until reached appropriate time.
    while (T) {
      Sys.sleep(dt)
      setTxtProgressBar(pb, as.numeric(Sys.time()))
      if (Sys.time() > end) {
        return(message()) # Return a line feed.
      }
    }
  } else {
    Sys.sleep(sec)
  }
}
