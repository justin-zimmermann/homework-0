#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.

# the data connection is made here. all inputs and outputs are defined here.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
load("~/learnings/edX-R-project/homework-0/sets.RData")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        
        validation_filtered <- validation
        
        if (input$genre != "All") {
            validation_filtered <- validation_filtered[grepl(input$genre, validation_filtered$genres, fixed=TRUE) ,]
        }
        if (input$rating != "All") {
            validation_filtered <- validation_filtered[input$rating == validation_filtered$rating ,]
        }

        # generate bins based on input$bins from ui.R
        x    <- validation_filtered$timestamp
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white', main = 'Time Stamp')

    })
    
    output$distPlot2 <- renderPlot({
        
        validation_filtered <- validation
        
        if (input$genre != "All") {
            validation_filtered <- validation_filtered[grepl(input$genre, validation_filtered$genres, fixed=TRUE) ,]
        }
        if (input$rating != "All") {
            validation_filtered <- validation_filtered[input$rating == validation_filtered$rating ,]
        }
        
        x    <- validation_filtered$rating
        bins <- seq(min(x), max(x), length.out = 10)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white', main = 'Rating')
        
    })
    
    output$table <- DT::renderDataTable(DT::datatable({
        
        validation_filtered <- validation
        
        if (input$genre != "All") {
            validation_filtered <- validation_filtered[grepl(input$genre, validation_filtered$genres, fixed=TRUE) ,]
        }
        if (input$rating != "All") {
            validation_filtered <- validation_filtered[input$rating == validation_filtered$rating ,]
        }
        
        validation_filtered
        
    }))

})
