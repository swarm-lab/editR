### Load libraries ###
library(shiny)
library(shinyAce)
library(shinyFiles)
library(knitr)
library(rmarkdown)
### ###


shinyServer(function(input, output, session) {
  
  ### Init logic###
  md_file <- readChar(md_name, file.info(md_name)$size)
  md_bak <<- md_file
  isolate({updateAceEditor(session, "rmd", value = md_file)})
  react <- reactiveValues(view = "dual", refresh = -1)
  ### ###
  
  
  ### Open file logic ###
  shinyFileChoose(input, 'my_open', session = session, 
                  roots = c(Computer = "~/"), filetypes = c('md', 'rmd'))
  
  observe({
    if (!is.null(input$my_open)) {
      file <- as.character(parseFilePaths(roots = c(Computer = "~/"), input$my_open)[1, 4])
      file <- normalizePath(file)
      
      md_name <<- basename(file)
      md_path <<- dirname(file)
      setwd(md_path)
      
      md_file <- readChar(md_name, file.info(md_name)$size)
      isolate({updateAceEditor(session, "rmd", value = md_file)})
    }
  })
  ### ###
  
  
  ### View menu logic ###
  observe({
    if (input$ef_plus > 0) {
      .Options$editR$editor_font_size <<- .Options$editR$editor_font_size + 1
      isolate({updateAceEditor(session, "rmd", fontSize = .Options$editR$editor_font_size)})
    }
  })
  
  observe({
    if (input$ef_minus > 0) {
      .Options$editR$editor_font_size <<- .Options$editR$editor_font_size - 1
      isolate({updateAceEditor(session, "rmd", fontSize = .Options$editR$editor_font_size)})
    }
  })
  
  output$pf_plus <- renderUI({
    if (input$pf_plus > 0) {
      .Options$editR$preview_font_size <<- .Options$editR$preview_font_size * 1.1
    }
    
    tags$head(tags$style(
      HTML(paste0("#knit_doc *{font-size: ", .Options$editR$preview_font_size, "em;}"))
    ))
  })
  
  output$pf_minus <- renderUI({
    if (input$pf_minus > 0) {
      .Options$editR$preview_font_size <<- .Options$editR$preview_font_size * (1 / 1.1)
      
      tags$head(tags$style(
        HTML(paste0("#knit_doc *{font-size: ", .Options$editR$preview_font_size, "em;}"))
      ))
    }
  })
  
  observe({
    if (input$ed_only > 0) {
      react$view <- "ed_only"
    }
  })
  
  observe({
    if (input$pr_only > 0) {
      react$view <- "pr_only"
    }
  })
  
  observe({
    if (input$dual > 0) {
      react$view <- "dual"
    }
  })
  
  output$view <- renderUI({
    if (react$view == "ed_only") {
      tags$head(tags$style(
        HTML("#rmd {right: 0%; left: 0%;} #knit_doc{left: 200%; right: -100%;}")
      ))
    } else if (react$view == "pr_only") {
      tags$head(tags$style(
        HTML(paste0("#rmd {right: 200%; left: -100%;} #knit_doc{left: 0%; right: 0%;}"))
      ))
    } else {
      tags$head(tags$style(
        HTML(paste0("#rmd {right: 50%; left: 0%;} #knit_doc{left: 50%; right: 0%;}"))
      ))
    }
  })
  
  observe({
    invalidateLater(50, session)
    isolate({updateAceEditor(session, "rmd", theme = .Options$editR$editor_theme)})
  })
  ###
  
  
  ### Update preview logic ###
  output$knit_doc <- renderUI({
    input$rmd
    md <- isolate(tryCatch(suppressWarnings(knit2html(text = input$rmd, fragment.only = TRUE, quiet = TRUE)),
                           error = function(e) {FALSE}))
    if (md == FALSE) {
      md <- md_bak
      md <- paste(md, tags$style(paste0("#knit_doc *{opacity: 0.5;}")))
    } else {
      md_bak <<- md
    }
    return(HTML(md))
  })
  ### ###
  
  
  ### Render file logic ###
  observe({
    if (input$render > 0 | !is.null(input$render_key)){
      isolate({
        cat(input$rmd, file = md_name)
        doc <- render(md_name)
        browseURL(doc)
      })
    }
  })
  ### ###
  
  
  ### Save file logic ###
  observe({
    if (input$save > 0 | !is.null(input$save_key)){
      isolate({cat(input$rmd, file = md_name)})
    }
  })
  ### ###
  
})
