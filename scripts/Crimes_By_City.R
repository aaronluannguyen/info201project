library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)

Crimes_By_City <- function(data, user.city){
  # Filter data for the input city
  city.data <- filter(data, city == user.city)
  # city.data<- data%>%filter(city == user.city)

  # Get vector of unique incident types
  incident.types <- sort(unique(city.data$parent_incident_type))

  # Set the bar labels to incident types
  x <- gsub(" ", "\n", incident.types) # replaces spaces with newlines

  # Function to get the number of calls of the desired crime
  # @param crime is a string of the desired crime, e.g. "Arson"
  # @returns the number of times 911 was dialed for the param crime
  GetCrimeFrequency <- function(crime) {
      result <- filter(city.data, parent_incident_type == crime)
      return(nrow(result))
  }

  y <- unlist(lapply(incident.types, GetCrimeFrequency))

#   y <- c(
#     nrow(city.data %>% filter(parent_incident_type == "Arson"))
#     , nrow(city.data %>% filter(parent_incident_type == "Assault"))
#     , nrow(city.data %>% filter(parent_incident_type == "Assault with Deadly Weapon"))
#     , nrow(city.data %>% filter(parent_incident_type == "Breaking & Entering"))
#     , nrow(city.data %>% filter(parent_incident_type == "Disorder"))
#     , nrow(city.data %>% filter(parent_incident_type == "Drugs"))
#     , nrow(city.data %>% filter(parent_incident_type == "Liquor"))
#     , nrow(city.data %>% filter(parent_incident_type == "Other"))
#     , nrow(city.data %>% filter(parent_incident_type == "Other Sexual Offense"))
#     , nrow(city.data %>% filter(parent_incident_type == "Property Crime"))
#     , nrow(city.data %>% filter(parent_incident_type == "Robbery"))
#     , nrow(city.data %>% filter(parent_incident_type == "Theft"))
#     , nrow(city.data %>% filter(parent_incident_type == "Theft from Vehicle"))
#     , nrow(city.data %>% filter(parent_incident_type == "Theft of Vehicle"))
#     , nrow(city.data %>% filter(parent_incident_type == "Traffic"))
#   )

  return(plot_ly(
    x = ~x, y = ~y, type = 'bar', marker = list(color = "#696969")) %>%
      # layout(title = "Crimes by City",
      layout(title = paste("911 Call Distribution in", str_to_title(user.city), sep = " "),
             margin = list(b = 75),
             xaxis = list(title = isolate("Types of Crimes Reported"), tickangle = 0, tickfont = list(size = 10)),
             yaxis = list(title = "Counts of Reported Incidents"))
  )
}


