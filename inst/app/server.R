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
  
  
  ### Update preview logic ###
  output$knitDoc <- renderUI({
    input$rmd
    return(isolate(HTML(
      tryCatch(suppressWarnings(knit2html(text = input$rmd, fragment.only = TRUE, quiet = TRUE)),
               error = function(e) "<div></div>")
    )))
  })
  ### ###
  
  
  ### Render file logic ###
  observe({
    if (input$my_render > 0 | !is.null(input$render_key)){
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
    if (input$my_save > 0 | !is.null(input$save_key)){
      isolate({cat(input$rmd, file = md_name)})
    }
  })
  ### ###
  
})
