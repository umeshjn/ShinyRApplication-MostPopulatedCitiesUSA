library(shiny)
library(ggplot2)
library(dplyr)
library(scales)
library(plotly)

mydata <- read.csv("data.csv")

ui <- fluidPage (
  
  titlePanel("Most Populated US Cities - 1900-2010"),
  
  fluidRow(
    column(12, selectInput("option", "Select the Year:", c(1900, 1920, 1940, 1960, 1980, 2010)))
  ),
  
  fluidPage(    
    fluidRow(
      column(12, plotlyOutput("plot", height = "480px"))
    )
  ),
  helpText("Source : http://www.infoplease.com/ipa/A0922422.html")
)
