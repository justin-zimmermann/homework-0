#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.

# All components of the dashboard are added here (sort of http code in R)
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Movie Lens 10M Data"),
    
    #row with selectinputs
    fluidRow(
        column(4,
               selectInput("genre",
                           "Genre:",
                           c("All", "Horror", "Western", "Comedy", "Action", "Drama", "Crime", "Romance", "Mystery", "Thriller"
                             ))
        ),
        column(4,
               selectInput("rating",
                           "Rating:",
                           c("All", seq(0.5, 5, by=0.5)
                           ))
        )
    ),
    
    # data table
    DT::dataTableOutput("table"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins for time stamps:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    ),
    
    plotOutput("distPlot2")
))
