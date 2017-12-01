# User Interface file

# Load necessary libraries
library(shiny)

# User interface here
shinyUI(fluidPage(
  navbarPage(title = p(strong(em("King County Police Activity"))),
             
             tabPanel("Home",
                      h1("Title Here")
                      
                      ),
             
             tabPanel("Aaron",
                      h1("Title Here")
                      
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