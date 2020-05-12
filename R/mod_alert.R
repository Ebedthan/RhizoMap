#' alert UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_alert_ui <- function(id, title, text){
  ns <- NS(id)
  tagList(
    shinyalert::useShinyalert()
  )
}

#' alert Server Function
#'
#' @noRd
mod_alert_server <- function(input, output, session){
  ns <- session$ns
  shinyalert::shinyalert(title = title,
                         text = text,
                         closeOnClickOutside = TRUE)

}

## To be copied in the UI
# mod_alert_ui("alert_ui_1")

## To be copied in the server
# callModule(mod_alert_server, "alert_ui_1")

