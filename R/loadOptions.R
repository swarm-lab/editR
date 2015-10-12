.loadOptions <- function() {
  if (.Platform$OS.type == "unix") {
    path <- "~/.editR"
  } else {
    path <- paste0(path.expand("~"), "/.editR")
  }
  
  if (file.exists(path)) {
    opt <- read.csv(path, stringsAsFactors = FALSE)
  } else {
    editR:::.createOptions()
    opt <- read.csv(path, stringsAsFactors = FALSE)
  }
  
  options(editR = list(editor_font_size = as.numeric(opt$value[opt$option == "editor_font_size"]),
                       editor_theme = opt$value[opt$option == "editor_theme"],
                       preview_font_size = as.numeric(opt$value[opt$option == "preview_font_size"])))
}

.createOptions <- function() {
  if (.Platform$OS.type == "unix") {
    path <- "~/.editR"
  } else {
    path <- paste0(path.expand("~"), "/.editR")
  }
  
  file.copy(from = paste0(find.package("editR"), "/editR.opt"),
            to = path)
}

.changeOptions <- function(option, value) {
  l <- getOption("editR")
  l[[which(names(l) == option)]] <- value
  options(editR = l)
}

.saveOptions <- function() {
  if (.Platform$OS.type == "unix") {
    path <- "~/.editR"
  } else {
    path <- paste0(path.expand("~"), "/.editR")
  }
  
  write.csv(data.frame(option = names(getOption("editR")),
                       value = unlist(getOption("editR"))),
            file = path, row.names = FALSE)
}
