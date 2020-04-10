#' loader UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_loader_ui <- function(id){
  ns <- NS(id)
  tagList(
    waiter::use_garcon(),
    waiter::use_waiter(),
    waiter::waiter_show_on_load(
      tags$img(
        src="www/rhizomap.png",
        height=250,
        id = "myImage"
      ),
      h2("Gerez durablement la fertilité de vos sols...")
    )
  )
}

#' loader Server Function
#'
#' @noRd
mod_loader_server <- function(input, output, session){
  ns <- session$ns
  g <- waiter::Garcon$new(
    id = "myImage",
    filter = "opacity",
    color = "#000000")

  for(i in 1:10){
    Sys.sleep(runif(1))
    g$set(i * 10)
  }

  waiter::waiter_hide()
}

## To be copied in the UI
# mod_loader_ui("loader_ui_1")

## To be copied in the server
# callModule(mod_loader_server, "loader_ui_1")
