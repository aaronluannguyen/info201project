# User Interface file

# Load necessary libraries
library(shiny)

# User interface here
shinyUI(fluidPage(

  navbarPage(title = p(strong(em("King County Police Activity"))),
             
             # Tabs here
             # Each person work with their assigned tab
             tabPanel("Home",
                      h1("Title Here")
                      
                      ),
             
             tabPanel("Aaron",
                      h1("Visualize Police Activity"),
                      br(),
                      selectInput("aaron_select", h3("Select Incident Type"), choices = crime.types, width = "100%"),
                      sliderInput("aaron_slider", h3("Select Range of Years"), width = "100%", 
                                  min = 2000, max = 2017,
                                  value = c(2000, 2017))
                      
                        
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