shinyUI(
  bootstrapPage(
    tags$head(
      tags$link(rel = 'stylesheet', type = 'text/css', href = 'editR.css'),
      tags$script(src = "actions.js")
    ),
    
    # Hidden buttons
    shinyFilesButton("my_open", "Open file", "Please select a file", FALSE),
    actionLink("my_save", "Save"),
    actionLink("my_render", "Render"),
    
    # Navigation bar
    bsNavBar("nav", brand = "editR", fixed = FALSE,
             leftItems = list(
               bsNavDropDown2(inputId = "dd1", label = "File", 
                              choices = list(c("Open file [Ctrl+o]", "open"), 
                                             c("Save file [Ctrl+s]", "save"),
                                             c("Render file [Ctrl+r]", "render"))
               )
             )),    
    
    aceEditor("rmd", mode = "markdown", wordWrap = TRUE, fontSize = 14,
              debounce = 10, autoComplete = "live", height = "auto",
              
    ),
    
    htmlOutput("knitDoc")
  )
)


