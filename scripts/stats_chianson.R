source("scripts/clean_data_chianson.R")
library(dplyr)
library(stringr)
library(stats)

# Read in csv file
police.data <- CleanseData("data/King_County_Police_Data.csv")

# Overall total number of calls from 2000 - 2017
total.calls <- nrow(police.data)

# Function to get frequency table of various columns in the king county data set
# @param column.name is the case-sensitive name of the column being queried.
# @returns a dataframe of the frequencies for desired column name
GetFreqTable <- function(column.name){
  result <- select(police.data, eval(parse(text = "column.name"))) %>% 
            group_by_(eval(parse(text = "column.name"))) %>% 
            summarise(Freq = n())
  return(result)
}

# Stats on property crime calls (most frequently called about)
incident.types <- sort(unique(police.data$parent_incident_type))
incident.freq.table <- GetFreqTable("parent_incident_type")
property.crime.total <- filter(incident.freq.table, parent_incident_type == "Property Crime") %>% 
                        pull(Freq)
property.crime.percent <- round(property.crime.total / sum(incident.freq.table$Freq) * 10000) / 100

# Stats on call days (average and standard deviation)
day.of.call.table <- GetFreqTable("day_of_week")
day.of.call.avg <- mean(day.of.call.table$Freq)
day.of.call.std <- sd(day.of.call.table$Freq)

# Stats on city calls
city.freq.table <- GetFreqTable("city")
city.most.calls <- pull(filter(city.freq.table, Freq == max(Freq)), city)
city.most.calls.total <- pull(filter(city.freq.table, Freq == max(Freq)), Freq)
city.least.calls <- pull(filter(city.freq.table, Freq == min(Freq)), city)
city.least.calls.total <- pull(filter(city.freq.table, Freq == min(Freq)), Freq)[1]

# Stats on call times
time.freq.table <- GetFreqTable("hour_of_day")
time.most.calls <- pull(filter(time.freq.table, Freq == max(Freq)), hour_of_day)
time.most.calls.total <- pull(filter(time.freq.table, Freq == max(Freq)), Freq)
time.least.calls <- pull(filter(time.freq.table, Freq == min(Freq)), hour_of_day)
time.least.calls.total <- pull(filter(time.freq.table, Freq == min(Freq)), Freq)[1]



