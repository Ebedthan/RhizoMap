#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#'
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    mod_loader_ui("loader_ui_1"),
    fluidPage(
      titlePanel("RhizoMap"),

      sidebarLayout(
        sidebarPanel(
          helpText("Create abundance maps with
                   ecological genomics on symbiotic bacteria
                   in CI soils."),
          mod_selectInput_ui("selectInput_ui_1",
                             label = "Choose a variable to display",
                             choices = c(1,2,3,4,5),
                             selected = 1),
          mod_sliderInput_ui("sliderInput_ui_1",
                             label = "Range of interest",
                             min = 0, max = 100, value = c(0, 100))
        ),

        mainPanel(
          echarts4r::echarts4rOutput("mapCI")
        )
      )
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
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
