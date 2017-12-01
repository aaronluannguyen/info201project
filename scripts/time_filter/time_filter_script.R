library(dplyr)
# library(plotly)
library(tidyr)
library(stringr)


# Read in king county police call data and only keeping city and hour_of_day column
police.data <- select(read.csv("data/king_county_data.csv", stringsAsFactors = FALSE), city, hour_of_day)
# Cleaning data, removing empty strings, "N/A" and rows with numbers in the cities column instead of city names
police.data <- police.data[which(police.data$city != "" & police.data$city != "N/A"), ]
police.data <- police.data[which(grepl("^[0-9]+$", police.data$city) == FALSE), ]
police.data$city <- str_to_title(police.data$city)
fix.city.name <- list("Seatle" = "Seattle", 
                      "Seatttle" = "Seattle", 
                      "Seattq" = "Seattle",
                      "Seatlle" = "Seattle",
                      "Sattle" = "Seattle",
                      "Aburn" = "Auburn",
                      "Aubirn" = "Auburn",
                      "New Castle" = "Newcastle",
                      "Covingtont" = "Covington",
                      "Maple Valle" = "Maple Valley",
                      "Kenmre" = "Kenmore",
                      "Kenmroe" = "Kenmore",
                      "Auburn Ave S" = "Auburn",
                      "Bujrien" = "Burien",
                      "Burieb" = "Burien",
                      "Seatec" = "Seatac",
                      "Carnation, Wa 98014" = "Carnation", 
                      "Woodinvile" = "Woodinville")

# Get unique city names
cities <- c(str_to_title(unique(police.data$city)), "All")

GetTimeFilterCity <- function(city.crime){
  result <- filter(police.data, city == city.crime) %>% 
            table()
  return(as.data.frame.matrix(result))
}

test <- GetTimeFilterCity("SEATTLE")

GetTimeFilterTime <- function(time.crime){
  result <- filter(police.data, hour_of_day == time.crime) %>% 
            table()
  return(as.data.frame.matrix(result))
}

test2 <- GetTimeFilterTime(0)