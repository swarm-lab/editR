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

