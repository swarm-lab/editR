#' Custom dialog box function for \code{\link[editR:editR-package]{editR}}
#'
#' This function creates custom Twitter Bootstrap 3 dialog boxes for \code{\link[editR:editR-package]{editR}}.  
#' 
#' @param id A unique identifier for the dialog box.
#' 
#' @param title The title to appear at the top of the dialog box.
#' 
#' @param trigger The id of a button or link that will open the dialog box.
#' 
#' @param ... UI elements to include within the dialog box (e.g. \code{\link[shiny:actionButton]{actionButtons}}).
#' 
#' @return This function return the html code for a dialog box. 
#' 
#' @author Simon Garnier: \email{garnier@@njit.edu}, \link[https://twitter.com/sjmgarnier]{@@sjmgarnier}
#' 
bs3_dialog <- function(id, title, trigger, ...) {
  tags$div(class = "modal sbs-modal fade", 
           id = id, tabindex = "-1", `data-sbs-trigger` = trigger, 
           tags$div(class = "modal-dialog", 
                    tags$div(class = "modal-content", 
                             tags$div(class = "modal-header", 
                                      tags$button(type = "button", 
                                                  class = "close", `data-dismiss` = "modal", 
                                                  tags$span(HTML("&times;"))), 
                                      tags$h4(class = "modal-title", title)), 
                             tags$div(class = "modal-footer", list(...))
                    )
           )
  )
}
