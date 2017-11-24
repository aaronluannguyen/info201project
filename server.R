# Server side file

# Load necessary libraries 
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

# Load king county police data 
# Remember to set working directory in console to this project
data <- read.csv("data/king_county_data.csv")

# Server side 
shinyServer(function(input, output) {
  
})