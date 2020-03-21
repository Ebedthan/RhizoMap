#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' 
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  g <- Garcon$new("myImage", filter = "opacity")
  
  for(i in 1:10){
    Sys.sleep(runif(1))
    g$set(i * 10)
  }
  
  waiter_hide()
}
