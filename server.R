 # Server side file


# rsconnect code to run in console below
#rsconnect::setAccountInfo(name='aaron-nguyen',
#                          token='F52E4104BEF9260EFB0008A71F2D69BE',
#                          secret='EVjqAYj2wWuVoatja/OKJy4BytZGu6U974bMre0/')


# Load necessary libraries 
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

# Load king county police data 
# Remember to set working directory in console to this project
police.activity.data <- read.csv('data/King_County_Sheriff_s_Office.csv', stringsAsFactors = FALSE)

# Server side 
shinyServer(function(input, output) {
  
  ### HOME #################################################################
  
  
  
  
  
  
  
  
  
  
  ### AARON ################################################################
  
  
  
  
  
  
  
  
  
  
  
  ### CHIANSON #############################################################
  
  
  
  
  
  
  
  
  
  
  ### KEIVON ###############################################################
  
  
  
  
  
  
  
  
  
  
  ### OMID #################################################################
  
  output$scatter <- renderPlotly({
    user.city <- input$cityname
    
    
    city.data<- police.activity.data%>%filter(city == user.city)
    
    x <- gsub(" ", "\n", sort(unique(police.activity.data$parent_incident_type))) # replaces spaces with newlines
    
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
      x = ~x, y = ~y, type = 'bar', color = I("black")) %>%
        layout(title = "Crimes by City",
               margin = list(b = 75),
               xaxis = list(title = isolate("Types of Crime"), tickangle = 0, tickfont = list(size = 10)),
               yaxis = list(title = "Counts of Reported Incidents"))
      
  )})
  
  ### ABOUT ################################################################
  
})