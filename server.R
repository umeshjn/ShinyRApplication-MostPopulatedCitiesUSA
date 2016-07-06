library(shiny)
library(ggplot2)
library(dplyr)
library(scales)
library(plotly)

mydata <- read.csv("data.csv")

server <- function(input, output){
  
  data <- reactive({
      mydata <- mydata %>% filter(Year == input$option)
      mydata$Place <- factor(mydata$Place, levels = mydata$Place[order(desc(mydata$Population))])
      mydata <- mydata %>% filter(Year == input$option)
  })
  
  
  output$plot <- renderPlotly({
      
    plot <- ggplot(data(), aes(Place, Population)) +
            geom_bar(stat = "identity", fill = "darkred") +
            scale_y_continuous(labels = comma) +
            theme_minimal() +
            xlab("City")
    p <- ggplotly(plot)
    p
  })
  
}