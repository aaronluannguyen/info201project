# Script file for Aaron's Dashboard Visualizations

# Load
library(dplyr)
library(ggplot2)
library(plotly)
library(leaflet)
library(maps)

# Reading in data for testing purposes
police.data <- read.csv("data/King_County_Police_Data.csv") %>%
  filter(grepl("Auburn|Barring|Beaux Arts|Bellevue|Black Diamond|Bothell|Burien|Carnation|Chelan|Covington| 
                 Des Moines|Duvall|Enumclaw|Everett|Fairwood|Fall City|Federal Way|Gold Bar|Grotto|Hobart| 
                 Issaquah|Kenmore|Kent|Kirkland|Lake Forest Park|LynnWood|Maple Valley|Monroe|Newcastle|North Bend| 
                 Preston|Puyallup|Ravensdale|Redmond|Renton|Sammamish|Seatac|Seattle|Shoreline|Skykomish|Skyway|Snoqualmie| 
                 Sumner|Tacoma|Tigard|Tukwila|Vashon|White Center|Woodinville", city, ignore.case = TRUE)) 

# function for producing a map plot of all crimes that occurred in data
map <- function(data) {
  
}

m <- leaflet() %>%
  addMarkers(data = police.data, 
             lng = ~police.data$longitude, lat = ~police.data$latitude,
             popup = police.data$parent_incident_type) %>%
  addTiles()

year.bars <- function(data) {
  
}