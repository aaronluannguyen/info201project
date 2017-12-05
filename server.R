 # Server side file


# rsconnect code to run in console below
#rsconnect::setAccountInfo(name='aaron-nguyen',
#                          token='F52E4104BEF9260EFB0008A71F2D69BE',
#                          secret='EVjqAYj2wWuVoatja/OKJy4BytZGu6U974bMre0/')


# Load necessary libraries 
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

source("scripts/Crimes_By_City.R")
data <- read.csv('data/King_County_Police_Data.csv', stringsAsFactors = FALSE)

# Load king county police data 
# Remember to set working directory in console to this project

# Server side 
shinyServer(function(input, output) {
  
  ### HOME #################################################################

  ### AARON ################################################################

  ### CHIANSON #############################################################

  ### KEIVON ###############################################################

  ### OMID #################################################################
  
  output$omidscatter <- renderPlotly({
      Crimes_By_City(data, input$omidcityname)
  })
  
  ### ABOUT ################################################################
  
})




# Load king county police data 
# Remember to set working directory in console to this project
