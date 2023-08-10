#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for the Shiny app
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Visualizing mtcars Dataset"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    sidebarPanel(
      # Input: Choose a variable to compare with mpg
      selectInput("variable", "Select a variable:",
                  choices = colnames(mtcars)[-1], selected = "cyl"),
      
      # Input: Choose a color for the plot points
      selectInput("color", "Select a color for points:",
                  choices = c("blue", "red", "green", "black"),
                  selected = "blue")
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      # Output: Interactive plot
      plotOutput("scatterplot"),
      
      # Output: Display summary statistics
      verbatimTextOutput("summary")
    )
  )
))