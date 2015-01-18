### Load libraries ###
library(shiny)
library(shinyBS)
library(shinyAce)
library(shinyFiles)
### ###


shinybootstrap2::withBootstrap2(
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
               bsNavDropDown2(inputId = "File", label = "File", 
                              choices = list(c("Open file", "open"), 
                                             c("Save file", "save"),
                                             c("Render file", "render"))
               ),
               bsNavDropDown2(inputId = "View", label = "View", 
                              choices = list(c("Editor only", "ed_only"), 
                                             c("Preview only", "pr_only"),
                                             c("Dual view", "dual"),
                                             c("~sep~"),
                                             c("Editor font size +", "ef_plus"), 
                                             c("Editor font size -", "ef_minus"),
                                             c("Editor theme", "e_theme"),
                                             c("~sep~"),
                                             c("Preview font size +", "pf_plus"),
                                             c("Preview font size -", "pf_minus"),
                                             c("~sep~"),
                                             c("Toggle auto-scroll", "auto_scroll")
                              )
               ),
               bsNavDropDown2(inputId = "Help", label = "Help", 
                              choices = list(c("Keyboard shortcuts", "keys"), 
                                             c("~sep~"),
                                             c("About editR", "about"))
               )
             )),    
    
    aceEditor("rmd", mode = "markdown", wordWrap = TRUE, fontSize = .Options$editR$editor_font_size,
              theme = .Options$editR$editor_theme, debounce = 100, autoComplete = "enabled", height = "auto"),
    
    uiOutput("pf_plus"), uiOutput("pf_minus"), uiOutput("view"),
    
    htmlOutput("knit_doc"),
    
    bsModal("k_s", "Keyboard shortcuts", trigger = "keys", href = "keyboard_shortcuts.html"),
    bsModal("info", "About", trigger = "about", href = "about.html"),
    uiOutput("editor_theme")
  )
)


