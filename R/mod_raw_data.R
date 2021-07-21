#' raw_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_raw_data_ui <- function(id){
  ns <- NS(id)
  tabPanel("Data",
           # Sidebar with a slider input for upload file
           sidebarLayout(
             sidebarPanel(
               fileInput(
                 ns("file"),
                 "Choose CSV File",
                 accept = ".csv"),
               tags$hr(),
               checkboxInput(ns("header"), "Header", TRUE)
             ),
             
             # Show a file content
             mainPanel(dataTableOutput(ns("contents")))
           ))
}
    
#' raw_data Server Functions
#'
#' @noRd 
mod_raw_data_server <- function(id){
  moduleServer( id, function(input, output, session){
    output$contents <- renderDataTable({
      # input$file will be NULL initially. After the user selects
      # and uploads a file, it will be a data frame with 'name',
      # 'size', 'type', and 'datapath' columns. The 'datapath'
      # column will contain the local filenames where the data can
      # be found.
      inFile <- input$file
      
      if(is.null(inFile))
        return(NULL)
      ext <- tools::file_ext(inFile$datapath)
      req(inFile)
      validate(need(ext == "csv", "Please upload a csv file"))
      # read the file 
      read.csv(inFile$datapath, header = input$header)
    })
  })
}
    
## To be copied in the UI
# mod_raw_data_ui("raw_data_ui_1")
    
## To be copied in the server
# mod_raw_data_server("raw_data_ui_1")
