#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import magrittr
#'
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  callModule(mod_loader_server, "loader_ui_1")

  output$mapCI <- echarts4r::renderEcharts4r({
    ci_sp <- raster::getData("GADM", country = "CIV", level = 2)
    ci_json <- geojsonio::geojson_list(ci_sp)
    ci_json$features <- ci_json$features %>%
      purrr::map(function(x){
        x$properties$name <- x$properties$NAME_2
        return(x)
    })
    echarts4r::e_charts() %>%
      echarts4r::e_map_register("ci_json", ci_json) %>%
      echarts4r::e_map(map = "ci_json")
  })
}
