#---- Server File 
source("./scripts/renderSuccessPlot.R")
source("./scripts/renderDistributionPlot.R")

#---- Libraries 
library(dplyr)
library(shiny)
library(plotly)

#---- Load Testing Data
kickstarter <- read.csv(file="./data/ks-projects-201612.csv", 
                        stringsAsFactors = FALSE)

#---- Start shinyServer
shinyServer(function(input, output) { 

  ### ------- Category Analysis Plots ------- ###
  
  ### ---------- Money Pledge Plots --------- ###
  
  ### ------ Success Statistics Plots ------- ###
  output$plot_success <- renderPlot({
    return(createSuccessPlot(kickstarter)) # see source() at top
  })
  
  ### -------- Distributions Plots ---------- ###
  output$plot_distribution <- renderPlotly({
    return(createDistributionPlot(kickstarter, input$selection))
  })
  
})