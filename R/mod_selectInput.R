#' selectInput UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_selectInput_ui <- function(id, label, choices, selected){
  ns <- NS(id)
  tagList(
    selectInput(id, label = label,
                choices = choices, selected = selected)
  )
}

#' selectInput Server Function
#'
#' @noRd
mod_selectInput_server <- function(input, output, session){
  ns <- session$ns

}

## To be copied in the UI
# mod_selectInput_ui("selectInput_ui_1")

## To be copied in the server
# callModule(mod_selectInput_server, "selectInput_ui_1")

