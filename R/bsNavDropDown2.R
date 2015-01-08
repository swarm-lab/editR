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
