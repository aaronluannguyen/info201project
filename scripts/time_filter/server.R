#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
source("time_filter_script.R")
library(shiny)
library(dplyr)
library(plotly)

# Define server logic required to draw a graph
shinyServer(function(input, output) {

    output$city.calls <- renderPlotly({
    choice <- input$city.choice
    if (choice == "All") {

    } else {
        result <- GetTimeFilterCity(choice)
    }

    })
})
