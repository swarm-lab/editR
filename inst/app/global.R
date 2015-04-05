### Load libraries ###
library(shiny)
library(shinyAce)
library(shinyFiles)
library(shinyBS)
### ###


### Set options ###
.Options$editR$editor_font_size <- ifelse(is.null(.Options$editR$editor_font_size), 
                                          14, .Options$editR$editor_font_size)
.Options$editR$editor_theme <- ifelse(is.null(.Options$editR$editor_theme), 
                                      "tomorrow", .Options$editR$editor_theme)
.Options$editR$preview_font_size <- ifelse(is.null(.Options$editR$preview_font_size), 
                                           1, .Options$editR$preview_font_size)
### ###


### Load app bits ###
bits <- paste0("bits/",
               c("header", "about", "keyboard", "hidden",
                 "navbar", "editor", "preview"), ".R")
sapply(bits, source)
### ###


### Prepare file ###
if (is.null(md_path)) {
  setwd(tempdir())
} else {
  setwd(md_path)
  
  if (!file.exists(md_name)) {
    template_path <- paste0(find.package("editR"), "/app/template.Rmd")
    template <- readChar(template_path, file.info(template_path)$size)
    cat(template, file = md_name)
  }
  
  md_bak <- NULL
}
### ###



