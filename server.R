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
data <- data %>%
  filter(longitude <= -116 & longitude >= -125) %>%
  filter(latitude <= 50 & latitude >= 44) 


# Server side 
shinyServer(function(input, output) {
  
  ### HOME #################################################################
  

  
  
  
  
  
  
  
  
  ### AARON ################################################################
  
  # Source functions from dashboard file for visualizations
  
  output$aaron_map <- renderLeaflet({
    
    # Filter data here depending on user input
    
    user.choose.crime <- input$aaron_select_crime
    user.choose.city <- input$aaron_select_city
    year.min <- as.Date(input$range[1], format = "%Y")
    year.max <- as.Date(input$range[2], format = "%Y")
    
    aaron.data <- data %>%
      mutate("incident_datetime_sep" = strsplit(incident_datetime, " "))
    
    # Filter by crime type chosen
    if (user.choose.crime != "All") {
      aaron.data <- aaron.data %>%
        filter(parent_incident_type == user.choose.crime)
    } 
    
    # Filter by city chosen
    if (user.choose.city != "All") {
      aaron.data <- aaron.data %>%
        filter(city == user.choose.city)
    }
    
    # Filter by range of years chosen
    aaron.data <- aaron.data %>%
      filter(as.Date(aaron.data$incident_datetime_sep[1], format = "%m/%d/%Y") >= year.min) %>%
      filter(as.Date(aaron.data$incident_datetime_sep[1], format = "%m/%d/%Y") <= year.max)
    
    print(nrow(aaron.data))
    # Map Visualization
    Map(aaron.data)
  })
        


  


  
  
  
  
  
  
  
  ### CHIANSON #############################################################
  
  
  
  
  
  
  
  
  
  
  ### KEIVON ###############################################################
  
  
  
  
  
  
  
  
  
  
  ### OMID #################################################################
  
  
  
  
  
  
  
  
  
  
  ### ABOUT ################################################################
  
  
  
  
  
  
  
  
  
  
  
})

