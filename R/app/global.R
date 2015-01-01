bsNavDropDown2 <- function (inputId, label, choices, ids, selected = "") {
  if (!inherits(label, "shiny.tag")) 
    label <- HTML(label)
  
  choices <- lapply(choices, FUN = function(choice) {
    if (length(choice) == 1) {
      tags$li(tags$a(tabindex = "-1", 
                     href = "#", HTML(choice), class="action-button"))
    } else {
      tags$li(tags$a(tabindex = "-1", 
                     href = "#", id = choice[2], 
                     HTML(choice[1])))
    }
  })
  
  tags$li(id = inputId, class = "dropdown sbs-dropdown", `data-value` = selected, 
          tags$a(href = "#", class = "dropdown-toggle", `data-toggle` = "dropdown", 
                 label, tags$b(class = "caret")), tags$ul(class = "dropdown-menu", choices))
}

setwd(tempdir())
wd <- NULL
md_name <- NULL
