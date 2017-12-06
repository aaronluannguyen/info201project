library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

Crimes_By_City <- function(data, user.city){

  city.data<- data%>%filter(city == user.city)
  
  x <- gsub(" ", "\n", sort(unique(data$parent_incident_type))) # replaces spaces with newlines
  
  y <- c(
    nrow(city.data %>% filter(parent_incident_type == "Arson"))
    , nrow(city.data %>% filter(parent_incident_type == "Assault"))
    , nrow(city.data %>% filter(parent_incident_type == "Assault with Deadly Weapon"))
    , nrow(city.data %>% filter(parent_incident_type == "Breaking & Entering"))
    , nrow(city.data %>% filter(parent_incident_type == "Disorder"))
    , nrow(city.data %>% filter(parent_incident_type == "Drugs"))
    , nrow(city.data %>% filter(parent_incident_type == "Liquor"))
    , nrow(city.data %>% filter(parent_incident_type == "Other"))
    , nrow(city.data %>% filter(parent_incident_type == "Other Sexual Offense"))
    , nrow(city.data %>% filter(parent_incident_type == "Property Crime"))
    , nrow(city.data %>% filter(parent_incident_type == "Robbery"))
    , nrow(city.data %>% filter(parent_incident_type == "Theft"))
    , nrow(city.data %>% filter(parent_incident_type == "Theft From Vehicle"))
    , nrow(city.data %>% filter(parent_incident_type == "Theft of Vehicle"))
    , nrow(city.data %>% filter(parent_incident_type == "Traffic"))
  )
  
  return(plot_ly(
    x = ~x, y = ~y, type = 'bar', color = I("blue")) %>%
      layout(title = "Crimes by City",
             margin = list(b = 75),
             xaxis = list(title = isolate("Types of Crime"), tickangle = 0, tickfont = list(size = 10)),
             yaxis = list(title = "Counts of Reported Incidents"))
    
  )
    
}

