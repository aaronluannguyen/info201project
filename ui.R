library(dplyr)
library(plotly)
library(shiny)


# Get the unique city names of King County
cities.vector <- sort(unique(police.call.data$city))

# Turn cities vector into a list so it can be used for the selectInput drop down choices
cities.list <- as.list(cities.vector)
names(cities.list) <- cities.vector # Set list elements names to city names

# Shiny app
shinyUI(fluidPage(
  
  # Browser tab name display
  title = "KC Sheriff Activity",

  navbarPage(title = p(strong(em("King County Sheriff Activity"))),
             
             # Tabs here
             # Each person work with their assigned tab
             tabPanel("Home",
                      h1("Title Here")
                      
                      ),
             
             tabPanel("Map",
                      
                        div(class = "outer", 
                            tags$head(
                              includeCSS("aaron_styles.css")),
                          
                      
                          leafletOutput("aaron_map", height = "100%"),
                      

                          absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                        draggable = TRUE, top = 250, left = 50, right = "auto", bottom = "auto",
                                        width = 275, height = "auto", opacity = 0.6,
                                      
                                        h1("King County Sheriff Activity"), 
  
                                        selectInput("aaron_select_crime", h3("Type of Crime"),
                                                    choices = c("All", data$parent_incident_type), width = "100%"),
                                    
                                        selectInput("aaron_select_city", h3("City"), choices = c("All", data$city), width = "100%"),
                                    
                                        sliderInput("range", h3("Range of Years"), min = 2000, max = 2017, 
                                                   sep = "", value = c(2000, 2017)
                                                   )
                         )
                        )
                      ),
             
             tabPanel("Call Frequency",
                      h1("Police Call Data by Time"),
                     
                      # Sidebar with a slider input desired city data
                      sidebarLayout(
                        sidebarPanel(
                          selectInput('city.choice', "What city do you want to see?",
                                      choices = cities.list)
                        ),
                        
                        # Show a plot and data table of police calls
                        mainPanel(
                          plotlyOutput("city.graph"),
                          DT::dataTableOutput("city.table")
                        )
                      )
                       ),
             
             tabPanel("Keivon",
                      h1("Title Here")
                      
                      ),
             
             tabPanel("Incidents by City",
                      h1("Crime By City Reported to King County"),
                      
                      # Radio buttons
                      sidebarLayout(
                        sidebarPanel(
                          
                          selectInput('omidcityname', 'City', choices = cities.list)
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
