library(shiny)
library(shinyAce)
library(shinyFiles)
library(tools)
library(knitr)

shinyServer(function(input, output, session) {
  
  ### Init logic###
  md_file <- readChar(md_name, file.info(md_name)$size)
  isolate({updateAceEditor(session, "rmd", value = md_file)})
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
      opts$editor_font_size <<- opts$editor_font_size + 1
      options(editR = opts)
      isolate({updateAceEditor(session, "rmd", fontSize = opts$editor_font_size)})
    }
  })
  
  observe({
    if (input$ef_minus > 0) {
      opts$editor_font_size <<- opts$editor_font_size - 1
      options(editR = opts)
      isolate({updateAceEditor(session, "rmd", fontSize = opts$editor_font_size)})
    }
  })
  
  output$pf_plus <- renderUI({
    if (input$pf_plus > 0) {
      opts$preview_font_size <<- opts$preview_font_size * 1.1
      options(editR = opts)
    }
    
    tags$head(tags$style(
      HTML(paste0("#knit_doc *{font-size: ", opts$preview_font_size, "em;}"))
    ))
  })
  
  output$pf_minus <- renderUI({
    if (input$pf_minus > 0) {
      opts$preview_font_size <<- opts$preview_font_size * (1 / 1.1)
      options(editR = opts)
      
      tags$head(tags$style(
        HTML(paste0("#knit_doc *{font-size: ", opts$preview_font_size, "em;}"))
      ))
    }
  })
  ###
  
  
  ### Update preview logic ###
  output$knit_doc <- renderUI({
    input$rmd
    return(isolate(HTML(
      tryCatch(suppressWarnings(knit2html(text = input$rmd, fragment.only = TRUE, quiet = TRUE)),
               error = function(e) "<div></div>")
    )))
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
