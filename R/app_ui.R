#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinythemes
#' @import dplyr
#' @import ggplot2
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    bootstrapPage(
      tags$head(includeHTML("gtag.html")),
      navbarPage(
        theme = shinytheme("flatly"),
        collapsible = TRUE,
        HTML(
          '<a style="text-decoration:none;cursor:default;color:#FFFFFF;" class="active" href="#">Quality Control</a>'
        ),
        id = "nav",
        windowTitle = "Quality control for high-throughput screening",
        mod_raw_data_ui("raw_data_ui_1")
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
      app_title = 'HCSQC'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

