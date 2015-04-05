#' Custom navbar function for \code{\link[editR:editR-package]{editR}}
#'
#' This function creates custom Twitter Bootstrap 3 navbars for \code{\link[editR:editR-package]{editR}}.  
#' 
#' @param name The name of the navbar.
#' 
#' @param navs A list of UI elements to include in the navbar (e.g. \code{\link[shiny:actionLink]{actionLinks}}).
#' 
#' @return This function return the html code for a Twitter Bootstrap 3 navbar. 
#' 
#' @author Simon Garnier: \email{garnier@@njit.edu}, \link[https://twitter.com/sjmgarnier]{@@sjmgarnier}
#' 
bs3_navbar <- function(brand = "My website", navs) {
  tags$nav(class = "navbar navbar-default",
           tags$div(class = "container-fluid",
                    tags$div(class = "navbar-header",
                             tags$a(brand, class = "navbar-brand",  href = "#")
                    ),
                    tags$div(
                      tags$ul(class = "nav navbar-nav",
                              lapply(navs, function(x) {tags$li(x)})
                      )
                    )
           )
  ) 
}
