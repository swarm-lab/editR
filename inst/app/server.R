### Load libraries ###
library(shiny)
library(shinyAce)
library(shinyFiles)
library(shinyBS)
library(knitr)
library(rmarkdown)
### ###


shinyServer(function(input, output, session) {
  
  ### Init logic###
  if (is.null(md_name)) {
    template_path <- paste0(find.package("editR"), "/app/template.Rmd")
    md_file <- readChar(template_path, file.info(template_path)$size)
  } else {
    md_file <- readChar(md_name, file.info(md_name)$size)
  }
  md_bak <<- md_file
  isolate({updateAceEditor(session, "rmd", value = md_file)})
  react <- reactiveValues(view = "dual", refresh = -1)
  ### ###
  
  ### New file logic ### 
  observe({
    if (input$save_current > 0) {
      toggleModal(session, "save_current_diag", toggle = "close")
      if (is.null(md_name)) {
        session$sendCustomMessage("saveas_new_file", "message")
      } else {
        isolate({writeChar(input$rmd, con = md_name)})
        setwd(tempdir())
        template_path <- paste0(find.package("editR"), "/app/template.Rmd")
        md_file <- readChar(template_path, file.info(template_path)$size)
        isolate({updateAceEditor(session, "rmd", value = md_file)})
      }
    }
  })
  
  shinyFileSave(input, "my_save_as_new_file", session = session, 
                roots = c(root = path.expand("~/")))
  
  observe({
    if (!is.null(input$my_save_as_new_file)) {
      file <- as.character(parseSavePath(roots = c(root = path.expand("~/")), 
                                         input$my_save_as_new_file)$datapath)
      file <- normalizePath(file)
      md_name <<- basename(file)
      md_path <<- dirname(file)
      setwd(md_path)
      isolate({writeChar(input$rmd, con = md_name)})
      
      setwd(tempdir())
      template_path <- paste0(find.package("editR"), "/app/template.Rmd")
      md_file <- readChar(template_path, file.info(template_path)$size)
      isolate({updateAceEditor(session, "rmd", value = md_file)})
    }
  })
  
  observe({
    if (input$discard_current > 0) {
      toggleModal(session, "save_current_diag", toggle = "close")
      setwd(tempdir())
      template_path <- paste0(find.package("editR"), "/app/template.Rmd")
      md_file <- readChar(template_path, file.info(template_path)$size)
      isolate({updateAceEditor(session, "rmd", value = md_file)})
    }
  })
  ### ###
  
  ### Open file logic ###
  shinyFileChoose(input, 'my_open', session = session, 
                  roots = c(root = path.expand("~/")), 
                  filetypes = c('md', 'rmd'))
  
  observe({
    if (!is.null(input$my_open)) {
      file <- as.character(parseFilePaths(roots = c(root = path.expand("~/")), 
                                          input$my_open)$datapath)
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
      editR:::.changeOptions("editor_font_size", getOption("editR")$editor_font_size + 1)
      editR:::.saveOptions()
      isolate({updateAceEditor(session, "rmd", fontSize = getOption("editR")$editor_font_size)})
    }
  })
  
  observe({
    if (input$ef_minus > 0) {
      editR:::.changeOptions("editor_font_size", getOption("editR")$editor_font_size - 1)
      editR:::.saveOptions()
      isolate({updateAceEditor(session, "rmd", fontSize = getOption("editR")$editor_font_size)})
    }
  })
  
  output$pf_plus <- renderUI({
    if (input$pf_plus > 0) {
      editR:::.changeOptions("preview_font_size", getOption("editR")$preview_font_size * 1.1)
      editR:::.saveOptions()
    }
    
    tags$head(tags$style(
      HTML(paste0("#knit_doc *{font-size: ", getOption("editR")$preview_font_size, "em;}"))
    ))
  })
  
  output$pf_minus <- renderUI({
    if (input$pf_minus > 0) {
      editR:::.changeOptions("preview_font_size", getOption("editR")$preview_font_size * (1 / 1.1))
      editR:::.saveOptions()
      
      tags$head(tags$style(
        HTML(paste0("#knit_doc *{font-size: ", getOption("editR")$preview_font_size, "em;}"))
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
    isolate({updateAceEditor(session, "rmd", theme = getOption("editR")$editor_theme)})
  })
  
  observe({
    if (!is.null(input$e_theme_choice)) {
      editR:::.changeOptions("editor_theme", input$e_theme_choice)
      editR:::.saveOptions()
      isolate({
        updateAceEditor(session, "rmd", theme = getOption("editR")$editor_theme)
      })
    }
  })
  ### ###
  
  
  ### Update preview logic ###
  output$knit_doc <- renderUI({
    input$rmd
    capture.output(
      md <- isolate(tryCatch(
        suppressMessages(
          suppressWarnings(
            knit2html(text = preview(input$rmd), 
                      fragment.only = TRUE, quiet = TRUE))),
        error = function(e) {FALSE})))
    if (md == FALSE) {
      md <- md_bak
      md <- paste(md, tags$style(paste0("#knit_doc *{opacity: 0.5;}")))
    } else {
      md_bak <<- md
    }
    return(withMathJax(HTML(md)))
  })
  ### ###
  
  
  ### Render file logic ###
  observe({
    if (input$render > 0 | !is.null(input$render_key)){
      isolate({
        writeChar(input$rmd, con = md_name)
        doc <- render(md_name)
        browseURL(doc)
      })
    }
  })
  ### ###
  
  
  ### Save file logic ###
  shinyFileSave(input, "my_save_as", session = session, 
                roots = c(root = path.expand("~/")))
  
  observe({
    if (!is.null(input$my_save_as)) {
      file <- as.character(parseSavePath(roots = c(root = path.expand("~/")), 
                                         input$my_save_as)$datapath)
      file <- normalizePath(file)
      md_name <<- basename(file)
      md_path <<- dirname(file)
      setwd(md_path)
      isolate({writeChar(input$rmd, con = md_name)})
    }
  })
  
  observe({
    if (input$save > 0){
      if (is.null(md_name)) {
        session$sendCustomMessage("saveas", "message")
      } else {
        isolate({writeChar(input$rmd, con = md_name)})
      }
    }
  })
  ### ###
  
})
