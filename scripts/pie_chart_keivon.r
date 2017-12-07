library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

pie <- function(user.data, crime_type){
  
  new.data <- user.data %>% 
    filter(parent_incident_type == crime_type) %>% 
    group_by(day_of_week) %>% 
    summarise(count = n())
  
  
  p <- plot_ly(new.data, labels = ~day_of_week, values = ~count, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text+text1',
               text = ~paste(day_of_week, "\n", count, "incidents")
  ) %>% 
    layout(title ="Police Activity During the Week", showlegend = T,
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  
  return(p)      
}