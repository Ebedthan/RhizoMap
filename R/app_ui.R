#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#'
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    mod_loader_ui("loader_ui_1"),
    bs4DashPage(
      sidebar_collapsed = TRUE,
      controlbar_collapsed = TRUE,
      bs4DashNavbar(),
      sidebar = bs4DashSidebar(
        title = "RhizoMap",
        skin = "light",
        status = "primary",
        brandColor = "primary",
        url = "#",
        src = "www/rhizomap.png",
        elevation = 3,
        opacity = 0.8,
        bs4SidebarMenu(
          id = "side-1",
          bs4SidebarMenuItem(
            tabName = "selectZone",
            text = "Selection de la Zone",
            icon = "home"
          )
        ),
        bs4SidebarMenu(
          id = "side-2",
          bs4SidebarMenuItem(
            tabName = "results",
            text = "Resultats",
            icon = "gears"
          )
        )
      ),
      bs4DashBody(
        h2("Selectionnez votre zone de culture"),
        tmap::tmapOutput("mapCI"),
        fluidRow(
          bs4Box(
            width = 6,
            height = "300px",
            mod_selectInput_ui("selectInput_ui_1",
                              label = "Choisisez dans la liste",
                              choices = c("a","b","c"),
                              selected = "a")
          ),
          bs4Box(
            width = 6,
            height = "300px",
            title = "La zone selectionnee",
            verbatimTextOutput("zonesel")
          )
        )
      ),
      footer = bs4DashFooter()
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'RhizoMap'
    ),
    shinyalert::useShinyalert()
  )
}
