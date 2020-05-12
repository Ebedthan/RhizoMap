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

  shinyalert::shinyalert(
    title = "Bienvenue sur RhizoMap",
    text = "RhizoMap vous assiste dans le choix de
            votre culture en fonction du potentiel
            symbiotique du sol de la zone que vous
            selectionnez. Suivez les instructions suivantes.",
    confirmButtonText = "Suivant",
    callbackR = function(){
      shinyalert::shinyalert(
        title = "1. Selectionnez la zone de culture",
        text = "Selectionnez d'abord votre zone de culture en
                cliquant sur la carte.",
        confirmButtonText = "Suivant",
        callbackR = function(){
          shinyalert::shinyalert(
            title = "2. Recevez des indications sur la culture à mettre en place",
            text = "Vous recevez une liste de cultures qui pourraient
                    favoriser une symbiose avec les micro-organismes
                    symbiotiques du sol.",
            confirmButtonText = "Suivant",
            callbackR = function(){
              shinyalert::shinyalert(
                title = "3. Explorez les recommandations",
                text = "Nous vous faisons une liste de recommandation pour activer
                        la gestion durable de la fertilité de votre sol.",
                confirmButtonText = "OK, allons-y!",
                callbackR = function(){
                  message("Ok message bien lu par l'utilisateur.")
                })
            }
          )
        }
      )
    }
  )

  output$mapCI <- tmap::renderTmap({
    ciSP <- readRDS("data-raw/gadm36_CIV_3_sp.rds")
    tmap::tm_shape(ciSP) + tmap::tm_borders(alpha = 0.5) +
      tmap::tm_fill("NAME_1", id = "NAME_3", legend.show = FALSE)
  })

  rv_map <- reactiveValues(Clicks = list())

  observeEvent(input$map_shape_click, {
    click <- input$map_shape_click
    print(str(click))
    rv_map$Clicks <- c(rv_map$Clicks, click$id)
    print(rv_map$Clicks)
  })

}
