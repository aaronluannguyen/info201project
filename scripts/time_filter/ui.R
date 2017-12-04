#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
source("time_filter_script.R")
library(plotly)
library(DT)
library(shiny)

# Get the unique city names of King County
cities.vector <- sort(unique(police.call.data$city))

# Turn cities vector into a list so it can be used for the selectInput drop down choices
cities.list <- as.list(cities.vector)
names(cities.list) <- cities.vector # Set list elements names to city names

# Define UI for application that displays a table and graph with King County police call data
# by each city
shinyUI(fluidPage(

  # Application title
  titlePanel("Police Call Data by Time"),

  # Sidebar with a slider input desired city data
  sidebarLayout(
    sidebarPanel(
        selectInput('city.choice', "What city do you want to see?",
                    choices = cities.list)
    ),

    # Show a plot and data table of police calls
    mainPanel(
        plotlyOutput("city.graph"),
        DT::dataTableOutput("city.table")
    )
  )
))
