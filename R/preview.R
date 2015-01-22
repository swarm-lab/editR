#' Prepare rmarkdown document for instant preview
#'
#' This function prepares a rmarkdown document edited with editR for instant preview.
#' It strips its front matter if it is present and add two extra line breaks at 
#' the end to prevent editR to "misbehave" when a code chunk is created at the 
#' very end of the document.  
#' 
#' @param rmd The rmarkdown document to prepare for instant preview.
#' 
#' @return This function return a rmarkdown document ready for instant preview in editR. 
#' 
#' @author Simon Garnier: \email{garnier@@njit.edu}, \link[https://twitter.com/sjmgarnier]{@@sjmgarnier}
#' 
preview <- function(rmd) {
  if (grepl("---\n(.*?)\n---", rmd)) {
    rmd <-  sub("---\n(.*?)\n---", "", rmd)
    rmd <- sub("\n\n", "", rmd)
  }
  
  paste0("`r opts_chunk$set(cache = TRUE, autodep = TRUE)` \n\n", rmd, "\n\n")
}
