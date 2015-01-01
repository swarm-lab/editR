library(shiny)
library(shinyBS)
library(shinyAce)
library(shinyFiles)

shinyUI(
  bootstrapPage(
    tags$head(
      tags$link(rel = 'stylesheet', type = 'text/css', href = 'editR.css'),
      tags$script(src = "performClick.js")
    ),
    
    # Hidden buttons
    shinyFilesButton("my_file", "Load file", "Please select a file", FALSE),
    actionLink("my_save", "Save file"),
    downloadLink("my_save_as", "Save file as"),
    
    # Navigation bar
    bsNavBar("nav", brand = "editR", fixed = FALSE,
             leftItems = list(
               bsNavDropDown2(inputId = "dd1", label = "File", 
                              choices = list(c("Open file", "open"), 
                                             c("Save file", "save"),
                                             c("Save as...", "save_as"),
                                             c("Render file", "render"))
               )
             )),    
    
    aceEditor("rmd", mode = "markdown", wordWrap = TRUE, fontSize = 14,
              debounce = 10, autoComplete = "live", height = "auto"),
    
    htmlOutput("knitDoc")
  )
)


