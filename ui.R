# User Interface file

# Load necessary libraries
library(shiny)

# User interface here
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
             
             tabPanel("Chianson",
                      h1("Title Here")
                       
                       ),
             
             tabPanel("Keivon",
                      h1("Title Here")
                      
                      ),
             
             tabPanel("Omid",
                      h1("Title Here")
                      
                      ),
             
             tabPanel("About",
                      h1("Why Did We Choose King County Police Data?")
                      
                      )
             
             )
))
