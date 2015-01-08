### Load libraries ###
library(shiny)
### ###


### Set options ###
.Options$editR$editor_font_size <- ifelse(is.null(.Options$editR$editor_font_size), 
                                          14, .Options$editR$editor_font_size)
.Options$editR$editor_theme <- ifelse(is.null(.Options$editR$editor_theme), 
                                      "tomorrow", .Options$editR$editor_theme)
.Options$editR$preview_font_size <- ifelse(is.null(.Options$editR$preview_font_size), 
                                           1, .Options$editR$preview_font_size)
### ###


### Prepare file ###
setwd(md_path)

if (!file.exists(md_name)) {
  template_path <- paste0(find.package("editR"), "/app/template.Rmd")
  template <- readChar(template_path, file.info(template_path)$size)
  cat(template, file = md_name)
}

md_bak <- NULL
### ###



