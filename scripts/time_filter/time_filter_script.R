library(dplyr)
# library(plotly)
library(tidyr)
library(stringr)


# Read in king county police call data and only keeping city and hour_of_day column
police.data <- select(read.csv("data/king_county_data.csv", stringsAsFactors = FALSE), city, hour_of_day)

# Cleaning data by removing empty strings, "N/A", rows with numbers in the cities column instead of city names
# and updating misspelled cities such as "Seattel" with the correct spelling, "Seattle"
police.data <- police.data[which(grepl("^[0-9]+$", police.data$city) == FALSE), ]
police.data$city <- str_to_title(police.data$city)
correct.city.names <- list("Seatle" = "Seattle",
                      "Seatttle" = "Seattle",
                      "Seattq" = "Seattle",
                      "Seatlle" = "Seattle",
                      "Sattle" = "Seattle",
                      "Seattel" = "Seattle",
                      "Seatte" = "Seattle",
                      "Aburn" = "Auburn",
                      "Aubirn" = "Auburn",
                      "New Castle" = "Newcastle",
                      "Covingtont" = "Covington",
                      "Maple Valle" = "Maple Valley",
                      "Kenmre" = "Kenmore",
                      "Kenmroe" = "Kenmore",
                      "Kenomre" = "Kenmore",
                      "Auburn Ave S" = "Auburn",
                      "Bujrien" = "Burien",
                      "Burieb" = "Burien",
                      "Seatec" = "SeaTac",
                      "Seatac" = "SeaTac",
                      "Carnation, Wa 98014" = "Carnation", 
                      "Woodinvile" = "Woodinville",
                      "Tuckwila" = "Tukwila",
                      "C17051435" = "",
                      "Shorelinee" = "Shoreline",
                      "Shorline" = "Shoreline",
                      "Barring" = "Baring",
                      "Safeway" = "",
                      "White Cneter" = "White Center",
                      "Snoqualmie Pass, Wa 98068" = "Snoqualmie",
                      "Snoqualmie Pass" = "Snoqualmie",
                      "Snoqulamie" = "Snoqualmie",
                      "Desmoines" = "Des Moines",
                      "Fred Meyer" = "",
                      "Mount Lake Terrance" = "Mountlake Terrace",
                      "Mount Lake Terrace" = "Mountlake Terrace",
                      "Lynnwod" = "Lynnwood",
                      "Vashon" = "Vashon Island"
                      )

CleanData <- function(vec){
  check.name <- match(vec, names(correct.city.names))
  if(!is.na(check.name)){
    vec <- correct.city.names[check.name] 
  }
  return(vec)
}
police.data$city <- unlist(sapply(police.data$city, CleanData), use.names = FALSE)

# Remove rows with empty strings or "N/A"
police.data <- police.data[which(police.data$city != "" & police.data$city != "N/A"), ]

# Get unique city names
cities <- sort(c(unique(police.data$city), "All"))

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