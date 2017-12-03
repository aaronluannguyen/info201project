# Server side file


# rsconnect code to run in console below
#rsconnect::setAccountInfo(name='aaron-nguyen',
#                          token='F52E4104BEF9260EFB0008A71F2D69BE',
#                          secret='EVjqAYj2wWuVoatja/OKJy4BytZGu6U974bMre0/')

# Source each person's file
source("scripts/dashboard-aaron.R")
source("scripts/time_filter/time_filter_script.R")


# Load necessary libraries 
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(leaflet)

# Load king county police data 
# Remember to set working directory in console to this project

# Read in data and clean it for any typos for city column
data <- CleanseData("data/King_County_Police_Data.csv")
data <- arrange(data, city)

crime.types <- distinct(data, parent_incident_type)

# Server side 
shinyServer(function(input, output) {
  
  ### HOME #################################################################
  

  
  
  
  
  
  
  
  
  ### AARON ################################################################
  
  # Filter data here depending on user input
  
  
  
  # Source functions from dashboard for visualizations
  output$aaron_map <- renderLeaflet({
    m
  })
        


  


  
  
  
  
  
  
  
  ### CHIANSON #############################################################
  
  
  
  
  
  
  
  
  
  
  ### KEIVON ###############################################################
  
  
  
  
  
  
  
  
  
  
  ### OMID #################################################################
  
  
  
  
  
  
  
  
  
  
  ### ABOUT ################################################################
  
  
  
  
  
  
  
  
  
  
  
})
