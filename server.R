#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic for the Shiny app
shinyServer(function(input, output) {
  
  # Create a reactive plot
  output$scatterplot <- renderPlot({
    x_var <- input$variable
    color <- input$color
    
    plot(mtcars[[x_var]], mtcars$mpg, main = paste("Scatterplot of MPG vs ", x_var),
         xlab = x_var, ylab = "Miles Per Gallon", pch = 19, col = color)
    
    # Add trendline
    lm_eq <- lm(mtcars$mpg ~ mtcars[[x_var]])
    abline(lm_eq, col = "red")
  })
  
  # Create a reactive summary output
  output$summary <- renderPrint({
    x_var <- input$variable
    summary_stats <- summary(mtcars[[x_var]])
    
    stats_text <- paste(
      "Summary Statistics", paste("MPG vs", x_var), "\n",
      paste("Min:", summary_stats[1]), "\n",
      paste("1st Qu.:", summary_stats[2]), "\n",
      paste("Median:", summary_stats[3]), "\n",
      paste("Mean:", summary_stats[4]), "\n",
      paste("3rd Qu.:", summary_stats[5]), "\n",
      paste("Max:", summary_stats[6]), "\n",
      sep = "\n"
    )
    
    cat(stats_text)
  })
})