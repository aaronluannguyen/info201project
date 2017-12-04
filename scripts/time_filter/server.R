#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
source("time_filter_script.R")
library(plotly)
library(DT)
library(shiny)
library(dplyr)

# Define server logic required to draw a graph
shinyServer(function(input, output) {
    output$city.table <- DT::renderDataTable({
        result.data <- group_by(police.call.data, city, hour_of_day) %>%
                       summarise(Freq = n()) %>%
                       group_by(city) %>%
                       filter(Freq == max(Freq))
        names(result.data) <- c("City", "Hour of Most 911 Calls (24hr clock)", "Number of Calls")
        dt <- DT::datatable(result.data)
    })

    output$city.graph <- renderPlotly({
            GetTimeFilterCity(input$city.choice)
        })

    output$time.graph <- renderPlotly({
        time.choice <- input$time.choice
    })
})
