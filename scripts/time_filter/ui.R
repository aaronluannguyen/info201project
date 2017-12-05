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
library(shiny)

cities.vector <- sort(c(unique(police.call.data$city), "All"))
cities.list <- as.list(cities.vector)
names(cities.list) <- cities.vector

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Filter by Time"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        selectInput('city.choice', "What city do you want to see?",
                    choices = cities.list)
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotlyOutput("distPlot")
    )
  )
))
