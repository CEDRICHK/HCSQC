library(checkmate)
library(here)

test_that("app ui", {
  setwd(here())
  ui <- app_ui()
  golem::expect_shinytaglist(ui)
  # Check that formals have not been removed
  fmls <- formals(app_ui)
  for (i in c("request")){
    expect_true(i %in% names(fmls))
  }
})

test_that("app server", {
  setwd(here())
  server <- app_server
  expect_is(server, "function")
  # Check that formals have not been removed
  fmls <- formals(app_server)
  for (i in c("input", "output", "session")){
    expect_true(i %in% names(fmls))
  }
})

# Configure this test to fit your need
test_that(
  "app launches",{
    setwd(here())
    golem::expect_running(sleep = 5)
  }
)

test_that("Transforms a given csv file into to tibble/data.frame", code = {
  setwd(here())
  # Construct our csv file test from an actual test.csv 
  # In this case a dummy data.frame written into a csv file, relative to the working directory
  csv_file = c()
  csv_file$datapath <- file.path(here::here("data/test.csv"))
  csv_file$name <- "test.csv"
  
  server <- app_server
  
  testServer(server, {
    
    session$setInputs(file = csv_file)
    # Notice the built in tibble expectation from checkmate library
    # expect_data_frame from the checkmate library 
    # it's exaclty the same as the tibble as the tibble type it's cross compatible
    expect_data_frame(read.csv(csv_file$datapath))
  })
})

test_that("Transforms a given csv file into to tibble/data.frame", code = {
  setwd(here())
  # Construct our csv file test from an actual test.csv 
  # In this case a dummy data.frame written into a csv file, relative to the working directory
  csv_file = c()
  csv_file$datapath <- file.path(here::here("data/test.csv"))
  csv_file$name <- "test.csv"
  
  server <- app_server
  
  testServer(server, {
    
    session$setInputs(file = csv_file)
    # Notice the built in tibble expectation from checkmate library
    # expect_data_frame from the checkmate library 
    # it's exaclty the same as the tibble as the tibble type it's cross compatible
    expect_data_frame(read.csv(csv_file$datapath))
  })
})