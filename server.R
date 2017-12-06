 # Server side file


# rsconnect code to run in console below
#rsconnect::setAccountInfo(name='aaron-nguyen',
#                          token='F52E4104BEF9260EFB0008A71F2D69BE',
#                          secret='EVjqAYj2wWuVoatja/OKJy4BytZGu6U974bMre0/')

# Source each person's file
source("scripts/dashboard-aaron.R")
source("scripts/clean_data_chianson.R")
source("scripts/Crimes_By_City.R")
source("scripts/time_filter_chianson.R")
source("scripts/Crimes_By_City.R")

# Load necessary libraries 
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(leaflet)
library(DT)

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
    year.min <- paste0(input$range[1], "-01-01 00:00")
    year.max <- paste0(input$range[2], "-12-31 23:59")
    
    aaron.data <- data 
    
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
      filter(as.POSIXct(incident_datetime, format = "%m/%d/%Y %H:%M") >= as.POSIXct(year.min)) %>%
      filter(as.POSIXct(incident_datetime, format = "%m/%d/%Y %H:%M") <= as.POSIXct(year.max))
    

    # Map Visualization
    Map(aaron.data)
  })
        
  ### CHIANSON #############################################################
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
  ### KEIVON ###############################################################

  ### OMID #################################################################
  
  output$omidscatter <- renderPlotly({
      Crimes_By_City(data, input$omidcityname)
  })
  
  ### ABOUT ################################################################
  
  
  
  
  
  
  
  
  
  
  
})




