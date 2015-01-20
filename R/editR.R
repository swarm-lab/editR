#' Edit Rmarkdown files with instant preview
#'
#' This function create a GUI to edit \code{\link[<rmarkdown>:<rmarkdown>-package]{Rmarkdown}} 
#' documents and display an instant preview of the document as it is being 
#' written. Rmarkdown documents can be rendered directly from the GUI. 
#' 
#' @param file The path (as a character string) to an existing .Rmd/.md file, or to a new .Rmd/.md file. If the file does not exist, it will be created when the GUI starts.
#' 
#' @return This function does not return anything.
#' 
#' @author Simon Garnier: \email{garnier@@njit.edu}, \link[https://twitter.com/sjmgarnier]{@@sjmgarnier}
#' 
#' @details If called from RStudio, it will open in the internal RStudio internet 
#' browser. If called from a terminal, it will open in your default internet 
#' browser. editR should work without any problem with the internal RStudio 
#' internet browser, as well as with recent versions of most internet browsers. 
#' It is likely to break with older versions.
#' 
#' @examples
#' # Create and edit a new Rmarkdown document in the current working directory
#' editR("example.Rmd")
#' 
#' @export
#'
editR <- function(file) {
  require(tools)
  require(shiny)
  
  if (missing(file)) 
    stop("'file' is missing. Please provide a path (as a string) to a new or an existing .Rmd or .md file.")
  
  ext <- tolower(file_ext(file))
  if (ext != "md" & ext != "rmd") 
    stop("'file' is not a .Rmd or .md file.")
  
  file <- suppressWarnings(normalizePath(file))
  
  md_name <- basename(file)
  md_path <- dirname(file)
  assign("md_name", md_name, envir=globalenv())
  assign("md_path", md_path, envir=globalenv())
  
  app_path <- paste0(find.package("editR"), "/app")
  runApp(app_path)
}

