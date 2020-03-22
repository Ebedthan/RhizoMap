#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#'
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  callModule(mod_loader_server, "loader_ui_1")

  output$mapCI <- renderPlot({
    ci_sp <-raster::getData("GADM", country = "CIV", level = 2)
    mapview::mapview(ci_sp)
  })
}
