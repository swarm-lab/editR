#' Custom dropdown menu function for \code{\link[editR:editR-package]{editR}}
#'
#' This function creates custom Twitter Bootstrap 3 dropdown menus for \code{\link[editR:editR-package]{editR}}.  
#' 
#' @param name The name of the dropdown menu.
#' 
#' @param navs A list of UI elements to include in the dropdown menu (e.g. \code{\link[shiny:actionLink]{actionLinks}}).
#' 
#' @return This function return the html code for a Twitter Bootstrap 3 dropdown menu. 
#' 
#' @author Simon Garnier: \email{garnier@@njit.edu}, \link[https://twitter.com/sjmgarnier]{@@sjmgarnier}
#' 
bs3_dropdown <- function(name = "My menu", navs) {
  tags$li(class = "dropdown",
          tags$a(name, class = "dropdown-toggle", "data-toggle" = "dropdown",
                 tags$span(class = "caret")
          ),
          tags$ul(class = "dropdown-menu",
                  lapply(navs, function(x) {tags$li(x)})
          )
  )
}
