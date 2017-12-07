source("scripts/clean_data_chianson.R")
library(dplyr)
library(plotly)
library(stringr)

police.call.data <- select(CleanseData("data/King_County_Police_Data.csv"),
                           city, hour_of_day)

# Creates and returns an interactive bargraph based on the city passed in.
# @param city.crime is the case-insensitive name of the city the graph is being drawn for
# @return is plotly bar graph object
GetTimeFilterCity <- function(city.crime){
    city.crime <- str_to_title(city.crime) # standardize case of city name passed in
    result.data <- filter(police.call.data, city == city.crime) %>%
                   table()
    result.data <- as.data.frame(result.data)
    # Create bar graph of results
    result.graph <- plot_ly(
        x = result.data$hour_of_day,
        y = result.data$Freq,
        type = "bar",
        marker = list(color = "#696969"),
        text = paste0("Hour: ", result.data$hour_of_day, "\n", "Calls: ", result.data$Freq),
        hoverinfo = "text"
    ) %>%
        layout(
            yaxis = list(title = "Number of Calls"),
            xaxis = list(title = str_to_title(paste("Time of Calls in", city.crime, "(24hr clock)", sep = " ")),
                         tickangle = 0),
            title = str_to_title(paste("Police Call Frequency in", city.crime, "(2000 - 2017)", sep = " "))
    )
    return(result.graph)
}
