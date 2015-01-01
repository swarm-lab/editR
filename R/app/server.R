library(shiny)
library(shinyAce)
library(shinyFiles)
library(knitr)

shinyServer(function(input, output, session) {
  
  ### Open file logic ###
  shinyFileChoose(input, 'my_file', session = session, 
                  roots = c(Computer = "~/"), filetypes = c('md', 'rmd'))
  
  observe({
    if (is.null(input$my_file)) 
      return(NULL)
    
    md_name <<- as.character(parseFilePaths(roots = c(Computer = "~/"), input$my_file)[1, 1])
    md_path <- as.character(parseFilePaths(roots = c(Computer = "~/"), input$my_file)[1, 4])
    
    wd <<- gsub(md_name, "", md_path)
    setwd(wd)
    
    md_file <- readChar(md_path, file.info(md_path)$size)
    isolate({updateAceEditor(session, "rmd", value = md_file)})
  })
  ### ###
  
  ### Update preview logic ###
  output$knitDoc <- renderUI({
    print(getwd())
    input$rmd
    return(isolate(HTML(
      tryCatch(suppressWarnings(knit2html(text = input$rmd, fragment.only = TRUE, quiet = TRUE)),
               error = function(e) "<div></div>")
    )))
  })
  ### ###
  
  ### Save file logic ###
  observe({
    if (is.null(input$my_save)) 
      return(NULL)
    
    if (is.null(md_name)) {
      return(NULL)
    } else {
      isolate({writeChar(input$rmd, md_name)})
    }
  })
  
  output$my_save_as <- downloadHandler(
    filename = function() {
      if (is.null(md_name)) {
        "untitled.Rmd"
      } else {
        md_name
      }
    },
    
    content = function(file) {
      print(file)
      isolate({writeChar(input$rmd, file)})
    }
  )
  ### ###
  
})
