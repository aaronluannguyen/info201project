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
                      #h1("Visualizing KC Sheriff Activity"),
                      #br(),
                      
                      #fluidRow(
                      #  column(6, 
                      #         selectInput("aaron_select_crime", h3("Select Incident Type"),
                      #                        choices = data$parent_incident_type, width = "50%")),
                      #  column(6, 
                      #         selectInput("aaron_select_city", h3("Select City"), choices = data$city, width = "50%"))
                      #),
                      #
                      #sliderInput("aaron_slider", h3("Select Range of Years"), width = "100%", 
                      #            min = 2000, max = 2017, sep = "", ticks = FALSE, value = c(2000, 2017)),
                      
                      bootstrapPage(
                        tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
                        leafletOutput("map", width = "100%", height = "100%"),
                        absolutePanel(
                          top = 80,
                          left = 30
                        )
                      )
                      
                      
                      
                      
                      
                      
                      ####### END OF MY TAB ########
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
