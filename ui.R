library(dplyr)
library(plotly)
library(shiny)

police.activity.data <- read.csv('data/King_County_Sheriff_s_Office.csv', stringsAsFactors = FALSE)
significant.cities <- police.activity.data %>% 
  group_by(city) %>% 
  summarize(n = n()) %>% 
  filter(n > 10) # filter to exclude typos in data
dropdown.options <- significant.cities$city

shinyUI(fluidPage(

  navbarPage(title = p(strong(em("King County Police Activity"))),
             
             # Tabs here
             # Each person work with their assigned tab
             tabPanel("Home",
                      h1("Title Here")
                      
                      ),
             
             tabPanel("Aaron",
                      h1("Visualize Police Activity")
                        
                      ),
             
             tabPanel("Chianson",
                      h1("Title Here")
                       
                       ),
             
             tabPanel("Keivon",
                      h1("Title Here")
                      
                      ),
             
             tabPanel("Omid",
                      h1("Crime By City Reported to King County"),
                      # Radio buttons
                      sidebarLayout(
                        sidebarPanel(
                          
                          selectInput('omidcityname', 'City', choices = dropdown.options)
                        ),
                        mainPanel(
                          plotlyOutput("omidscatter"),
                          br(),
                          p("This is an interactive graph that displays crime information for user-selected cities in reported King County.", align = "center"),
                          br(),
                          p("Working with this data helped us gain valuable insights into the spatial differences in the types of crimes perpetuated. For instance- Seattle had a more balanced crime profile to Burien which had far more proprty crimes than any other crime. In the data available- it's also interesting to see that Property Crimes are higher than other crimes from almost all cities selected. We decided to further explore this- and discovered this could be attributed to the county's growing poverty population.  ", align = "center")
                        )
                      )
                      ),
             
             tabPanel("About",
                      h1("Why Did We Choose King County Police Data?")
                      
                      )
             
             )
))
