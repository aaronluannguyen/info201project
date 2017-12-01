library(dplyr)
library(plotly)
library(tidyr)
library(stringr)


# Read in king county police call data
police.data <- select(read.csv("data/king_county_data.csv", stringsAsFactors = FALSE), city, hour_of_day)

# Get unique city names
cities <- c(str_to_title(unique(police.data$city)), "All")
# Eliminate the empty and n/a values. N/A was coded as text in CSV file, so could
# not use !is.na(cities)
cities <- cities[cities != "" & cities != "N/A"]

GetTimeFilterCity <- function(city.crime){
  result <- filter(police.data, city == city.crime)
}

test <- GetTimeFilterCity("Seattle")

GetTimeFilterTime <- function(time.crime){
  
}