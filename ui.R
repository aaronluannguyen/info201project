library(dplyr)
library(plotly)
library(shiny)
shinyUI(fluidPage(
  
  # Radio buttons
  sidebarLayout(
    sidebarPanel(
      
      selectInput('cityname', 'City', choices = c("AUBURN", "BURIEN", "SEATTLE"), selected = "BURIEN"),
      actionButton("goButton", "Go!")
    ),
    mainPanel(plotlyOutput("scatter"))
  ))
  
  
)
