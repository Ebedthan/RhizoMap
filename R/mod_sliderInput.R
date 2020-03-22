#' sliderInput UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_sliderInput_ui <- function(id, label, min, max, value){
  ns <- NS(id)
  tagList(
    sliderInput(id, label = label, min = min, max = max, value = value)
  )
}

#' sliderInput Server Function
#'
#' @noRd
mod_sliderInput_server <- function(input, output, session){
  ns <- session$ns

}

## To be copied in the UI
# mod_sliderInput_ui("sliderInput_ui_1")

## To be copied in the server
# callModule(mod_sliderInput_server, "sliderInput_ui_1")

