library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(scales)

pie <- function(user.data, crime_type){
  total<- user.data %>% 
    filter(parent_incident_type == crime_type) %>%
    summarise(count = n())
  total <- as.matrix(total)
  total <- as.vector(total)
          
  new.data <- user.data %>% 
    filter(parent_incident_type == crime_type) %>% 
    group_by(day_of_week) %>% 
    summarise(count = n())
  
  bp<- ggplot(new.data, aes(x="", y=count, fill=day_of_week))+
    geom_bar(width = 1, stat = "identity")
  
  pie <- bp + coord_polar("y", start=0) + 
    geom_text(aes(y = count + c(0, cumsum(count)[-length(count)]), label = percent(count/total)), size=3)
  return(pie)      
}

