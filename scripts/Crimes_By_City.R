library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(stringr)

CrimesByCity <- function(data, user.city){
  # Filter data for the input city
  city.data <- filter(data, city == user.city)

  # Get vector of unique incident types
  incident.types <- sort(unique(city.data$parent_incident_type))

  # Function to get the number of calls of the desired crime
  # @param crime is a string of the desired crime, e.g. "Arson"
  # @returns the number of times 911 was dialed for the param crime
  GetCrimeFrequency <- function(crime) {
      result <- filter(city.data, parent_incident_type == crime)
      return(nrow(result))
  }

  # Set x and y of bar graph to call types and call frequencies respectively
  x <- gsub(" ", "\n", incident.types) # replaces spaces with newlines
  y <- unlist(lapply(incident.types, GetCrimeFrequency))

  # Create plotly bar graph
  result.graph <- (plot_ly(
    x = ~x, y = ~y, type = 'bar', marker = list(color = "#696969")) %>%
      layout(title = paste("Reported Incidents in", str_to_title(user.city), sep = " "),
             margin = list(b = 75),
             xaxis = list(title = isolate("Types of Crimes Reported"), tickangle = 0, tickfont = list(size = 10)),
             yaxis = list(title = "Counts of Reported Incidents"))
  )
  # Create and return a plotly bar graph
  return(result.graph)
}