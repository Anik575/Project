#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
library(tidyverse)
library(shiny)
data(mtcars)

ui <- fluidPage(
  titlePanel("mtcars Explorer"),
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "X-axis Variable:", names(mtcars)),
      selectInput("yvar", "Y-axis Variable:", names(mtcars), selected = "mpg"),
      checkboxInput("smooth", "Add trend line?", TRUE)
    ),
    mainPanel(
      plotOutput("scatterplot")
    )
  )
)


server <- function(input, output){
  output$scatterplot <- renderPlot({
    ggplot(mtcars, aes_string(x= input$xvar, y= input$yvar))+
      geom_point() +
      (if(input$smooth) geom_smooth(method = "lm"))
  })
}

shinyApp(ui, server)

#Using this simple web app I can see the correlation between mpg and hp , disp and hp as well and so many. 
# mpg =  Miles Per Gallon, disp = Engine displacement, hp = Horsepower.














