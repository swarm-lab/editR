preview <- function(rmd) {
  if (grepl("---\n(.*?)\n---", rmd)) {
    rmd <-  sub("---\n(.*?)\n---", "", rmd)
    rmd <- sub("\n\n", "", rmd)
  }
  
  paste("`r opts_chunk$set(cache = TRUE, autodep = TRUE)`\n", rmd)
}
