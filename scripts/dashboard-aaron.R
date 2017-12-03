# Script file for Aaron's Dashboard Visualizations

# Load
library(dplyr)
library(ggplot2)
library(plotly)
library(leaflet)
library(RColorBrewer)
library(maps)
source("scripts/time_filter/time_filter_script.R")

# Reading in data for testing purposes
police.data <- CleanseData("data/King_County_Police_Data.csv") 
police.data <- police.data %>%
  filter(longitude <= -116 & longitude >= -125) %>%
  filter(latitude <= 50 & latitude >= 44)
test2 <- police.data %>% distinct(parent_incident_type)

# function for producing a map plot of all crimes that occurred in data
map <- function(data) {
  
  pal <- colorFactor(
    topo.colors(15), police.data$parent_incident_type
  )
  m <- leaflet() %>%
    addProviderTiles(providers$CartoDB.Positron) %>%
    addCircleMarkers(data = police.data, 
                     lng = ~police.data$longitude, lat = ~police.data$latitude,
                     color = ~pal(police.data$parent_incident_type), fillOpacity = 1,
                     popup = police.data$parent_incident_type, clusterOptions = markerClusterOptions()) %>%
    addLegend("topright", title = "Crime Color Classification", pal=pal, values = police.data$parent_incident_type, opacity = 1) %>%
    setView(lng = -120.74, lat = 45.7511, zoom = 7)
  return(m)
  
}


year.bars <- function(data) {
  
}
