library(dplyr)
library(plotly)
library(shiny)

city <- sort(unique(police.activity.data$city))


police.activity.data <- read.csv('data/King_County_Sheriff_s_Office.csv', stringsAsFactors = FALSE)


city.data<- police.activity.data%>%filter(city == "KIRKLAND")
x <- sort(unique(parent.crime.type$parent_incident_type))

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
, nrow(city.data %>% filter(parent_incident_type == "Theft"))
, nrow(city.data %>% filter(parent_incident_type == "Traffic"))
)
data <- data.frame(x, y)

p <- plot_ly(data, x = ~x, y = ~y, type = 'bar', color = I("black")) %>%
  layout(title = "Crimes by City",
         xaxis = list(title = "Types of Crime"),
         yaxis = list(title = "Counts of Reported Incidents"))

p













shinyServer(function(input, output) {
  
  # Reder a histogram of a given color
  output$scatter <- renderPlotly({
    return(plot_ly(
      data = cereal.data, 
      x = cereal.data[[input$nutrition]], 
      y = ~rating,
      
      # Hover text: When user hovers over, the name and the size appears. The size of the circle 
      #corresponds to the number of sugars in the cereal. 
      #color = red,
      size = ~sugars, 
      type = "scatter",
      name = input$nutrition
    ) %>% add_trace(
      x = cereal.data[[input$nutrition1]],
      name = input$nutrition1
    ) 
    
    %>% 
      layout(
        yaxis = list(
          title = 'Ratings'
        )
      ) %>% 
      
      layout(
        title = "Nutrition in Cereal",
        xaxis = list(
          title = paste0(input$nutrition, " vs. ", input$nutrition1)
        )
      )
    
    
    )
  })
})





