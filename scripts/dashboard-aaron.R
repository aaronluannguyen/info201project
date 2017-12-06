# Script file for Aaron's Dashboard Visualizations

# Load
library(dplyr)
library(ggplot2)
library(plotly)
library(leaflet)
library(RColorBrewer)
library(maps)



# function for producing a map plot of all crimes that occurred in data
Map <- function(data.df) {
  
  pal <- colorFactor(
    heat.colors(nrow(distinct(data.df, parent_incident_type))), data.df$parent_incident_type
  )
  m <- leaflet() %>%
    addProviderTiles(providers$Hydda.Full) %>%
    addCircleMarkers(data = data.df, 
                     lng = ~data.df$longitude, lat = ~data.df$latitude,
                     color = ~pal(data.df$parent_incident_type), fillOpacity = 1,
                     popup = ~paste0(strong("Case Number: "), data.df$case_number, "<br>", 
                                     strong("Incident Date & Time: "), data.df$incident_datetime, "<br>",
                                     strong("Description: "), data.df$incident_description, "<br>",
                                     strong("Address: "), data.df$address_1, " <br>", 
                                     "&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp",
                                     data.df$city, ", ", data.df$state, " ", data.df$zip
                                     ), 
                     clusterOptions = markerClusterOptions()) %>%
    addLegend("topright", title = "Crime Classification Colors", pal=pal, values = data.df$parent_incident_type, opacity = 1) %>%
    setView(lng = -120.74, lat = 46.8511, zoom = 8)
  return(m)
  
}


