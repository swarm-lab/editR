### Load libraries ###
library(shiny)
### ###


### Define custom functions ###
bsNavDropDown2 <- function (inputId, label, choices, ids, selected = "") {
  if (!inherits(label, "shiny.tag")) 
    label <- HTML(label)
  
  choices <- lapply(choices, FUN = function(choice) {
    if (length(choice) == 1) {
      if (choice[1] == "~sep~") {
        tags$li(tags$hr(class = "hr_menu"))
      } else {
        tags$li(tags$a(tabindex = "-1", 
                       href = "#", HTML(choice), class="action-button"))
      }
    } else {
      if (choice[1] == "~sep~") {
        tags$li(tags$hr(class = "hr_menu"))
      } else {
        tags$li(tags$a(tabindex = "-1", 
                       href = "#", id = choice[2], 
                       HTML(choice[1]), class="action-button"))
      }
    }
  })
  
  tags$li(id = inputId, class = "dropdown sbs-dropdown", `data-value` = selected, 
          tags$a(href = "#", class = "dropdown-toggle", `data-toggle` = "dropdown", 
                 label, tags$b(class = "caret")), tags$ul(class = "dropdown-menu", choices))
}
### ###


### Set options ###
opts <- getOption("editR")
options(editR = 
          list(
            editor_font_size = ifelse(is.null(opts$editor_font_size), 14, opts$editor_font_size),
            editor_theme = ifelse(is.null(opts$editor_theme), "tomorrow", opts$editor_theme),
            preview_font_size = ifelse(is.null(opts$preview_font_size), 1, opts$preview_font_size)
          )
)
opts <- getOption("editR")
### ###


### Prepare file ###
setwd(md_path)

if (!file.exists(md_name)) {
  template_path <- paste0(find.package("editR"), "/app/template.Rmd")
  template <- readChar(template_path, file.info(template_path)$size)
  cat(template, file = md_name)
}

md_bak <- NULL
### ###



