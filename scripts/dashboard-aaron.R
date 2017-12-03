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


# function for producing a map plot of all crimes that occurred in data
map <- function(data) {
  
}
pal <- colorFactor(
  topo.colors(10), police.data$parent_incident_type
)
m <- leaflet() %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addCircleMarkers(data = police.data, 
             lng = ~police.data$longitude, lat = ~police.data$latitude,
             color = ~pal(police.data$parent_incident_type), fillOpacity = 1,
             popup = police.data$parent_incident_type, clusterOptions = markerClusterOptions()) 


year.bars <- function(data) {
  
}
