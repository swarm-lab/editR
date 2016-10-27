#' Open current file with editR
#' 
#' Open current file in editor with editR.
#'
#' @export
#'
openCurrent <- function(){
  context <- rstudioapi::getActiveDocumentContext()
  cat(paste0("Opening file ", context$path, " with editR"))
  editR::editR(file = context$path)
}

