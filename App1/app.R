library(shiny)
library(rsconnect)
library(tidyverse)
library(lubridate)
library(png)
library(grid)
library(stringr)
library(googlesheets)

ui <- fluidPage(
    mainPanel(
      tableOutput("gsheet")
  )
)

server <- function(input, output) {
  
  options(shiny.maxRequestSize=60*1024^2)
  
  filedata_selector <- gs_title("poop")
  filedata_table <- filedata_selector %>% gs_read_csv(ws=1)

  output$gsheet <- renderTable({
    filedata_table
  })
}

shinyApp(ui, server)
