shinyUI(
  bootstrapPage(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "editR.css"),
      tags$script(src = "actions.js")
    ),
    
    # Hidden buttons
    shinyFilesButton("my_open", "Open file", "Please select a file", FALSE),
    
    # Navigation bar
    bsNavBar("nav", brand = "editR", fixed = FALSE,
             leftItems = list(
               bsNavDropDown2(inputId = "dd1", label = "File", 
                              choices = list(c("Open file [Ctrl-O]", "open"), 
                                             c("Save file [Ctrl-S]", "save"),
                                             c("Render file [Ctrl-R]", "render"))
               ),
               bsNavDropDown2(inputId = "dd1", label = "View", 
                              choices = list(c("Editor font size +", "ef_plus"), 
                                             c("Editor font size -", "ef_minus"),
                                             c("~sep~"),
                                             c("Preview font size +", "pf_plus"),
                                             c("Preview font size -", "pf_minus"))
               )
             )),    
    
    aceEditor("rmd", mode = "markdown", wordWrap = TRUE, fontSize = opts$editor_font_size,
              theme = opts$editor_theme, debounce = 10, autoComplete = "live", height = "auto"),
    
    uiOutput("pf_plus"), uiOutput("pf_minus"),
    
    htmlOutput("knit_doc")
  )
)


